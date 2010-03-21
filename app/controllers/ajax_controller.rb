class AjaxController < ApplicationController
  around_filter :shopify_session
  protect_from_forgery :except => [:vendor_products, :receiving_item, :methods, :collection_products]
  
  def collection_products
    #if(request.post?)
      collection_ids = params['collection_ids'].to_a
      @products = []
      collection_ids.each do |col_id| 
        ShopifyAPI::Collect.find(:all, :params => {:collection_id => col_id}).map do |collect| 
          @products << ShopifyAPI::Product.find(collect.product_id)
        end #map
      end #each
      render(:partial => 'product_checkboxes')
    #end #if
  end
  
  #no longer used?
  #def receiving_item
  #  pvid = params['pvid']
  #  pid, vid = pvid.split("|")
  #  product = ShopifyAPI::Product.find(pid)
  #  variant = ShopifyAPI::Variant.find(vid, :params => { :product_id => pid })
  #  title = variant.title =~ /Default/ ? product.title : product.title + "(" + variant.title + ")"
  #  @receiving_item = ReceivingItem.new(
  #    :variant_id => vid, 
  #    :product_id => pid, 
  #    :title => title,
  #    :sku => variant.sku)
  #  render(:layout => false)
  #end
  
  def receiving_items
    product_variant_ids = params['product_variant_ids']
    if(product_variant_ids.blank?)
      render :text => "No products were selected for this receiving. Please select at least one product to receive."
    else
      @receiving = Receiving.new()
      @receiving.shopify_store_id = current_shop.id
      @variants = Hash.new()
      product_variant_ids.each do |pvid|
        pid, vid = pvid.split("|")
        product = ShopifyAPI::Product.find(pid)
        variant = ShopifyAPI::Variant.find(vid, :params => { :product_id => pid })
        title = variant.title =~ /Default/ ? product.title : product.title + "(" + variant.title + ")" 
        @receiving.receiving_items << ReceivingItem.new(
          :variant_id => vid, 
          :product_id => pid, 
          :title => title,
          :sku => variant.sku)
      end #each
      render(:layout => false)
    end #if
    
    rescue ActiveResource::ResourceNotFound => e
      # Just ignore it ?!?
  end
  
  def stock_adjustment_items
    product_variant_ids = params['product_variant_ids']
    if(product_variant_ids.blank?)
      render :text => "No products were selected for this stock adjustment. Please select at least one product to adjust stock for."
    else
      @stock_adjustment = StockAdjustment.new()
      @stock_adjustment.shopify_store_id = current_shop.id
      @variants = Hash.new()
      product_variant_ids.each do |pvid|
        pid, vid = pvid.split("|")
        product = ShopifyAPI::Product.find(pid)
        variant = ShopifyAPI::Variant.find(vid, :params => { :product_id => pid })
        title = variant.title =~ /Default/ ? product.title : product.title + "(" + variant.title + ")" 
        @stock_adjustment.stock_adjustment_items << StockAdjustmentItem.new(
          :variant_id => vid, 
          :product_id => pid, 
          :title => title,
          :sku => variant.sku)
      end #each
      render(:layout => false)
    end #if
    
    rescue ActiveResource::ResourceNotFound => e
      # Just ignore it ?!?
  end

  def vendor_products
    #if(request.post?)
      vendor_name = params['vendor_name']
      @products = ShopifyAPI::Product.find(:all, :params => {:vendor => vendor_name})
      render(:partial => 'product_checkboxes')
    #end #if
  end
  
  def methods
    case params['method']
    when 'vendors'
      @vendor_names = ShopifyAPI::Product.find(:all).map{|product| product.vendor}.uniq
      render(:partial => 'vendor_select')
    when 'collections'
      @collections = ShopifyAPI::CustomCollection.find(:all) + ShopifyAPI::SmartCollection.find(:all)
      render(:partial => 'collection_select')
    end
  end
  
end
