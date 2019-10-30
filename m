Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B1E94CF
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C51AAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:23 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C17D2C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:21 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 41so681641oti.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aNU3UJkRWwuIbKkYV6YRYPMwMlvvGPNTR9dslcB5nas=;
 b=HMCVB4TruDkNr3rBCObTsXwEK31RXm9CHjpuMgo8zy3M4blK0LcLJqwx1N1hPBUjJt
 Fh03yw/GCUZQxmTZXntZCtypawtaVGaCTPTi0VPWrWOzxaDTPbZkZ2tH9XGVpbJgye6p
 /R6bFOOtAUBrpqxQquoEMBlUnGBV1wrwzcPYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNU3UJkRWwuIbKkYV6YRYPMwMlvvGPNTR9dslcB5nas=;
 b=LDjVcfurHbMEe657B3j7WNE+MIv/wUVVYALTLIYPTu+4Qae1TSlBcJANhdKsaPSDMK
 gXZ4qG6zXAD6x0VfrOiNDxRZeFFhm9xtDWIIxzE5TTncsWV4WCOlowp6DMSeEU4/pL3Q
 wTsbnqSBKEzRh69V9py5KYr+MLqbWwMrGva4iyOsUhJnCencJF5sGp1I3VmIyv0dU1j0
 JkQqG72o52KfRiE3gY+hwJacdHSuGms8DdVUcCiTKrOVwJe7U5qL5J1GaDcbzYQFrbqX
 00Lq0vnZ+VOKnMgNG/33lkEcbLfFdUuBQbut4yPQbHFaBBPA0k4gA9f/eoFmV6j6er2A
 VMSw==
X-Gm-Message-State: APjAAAXGPrZyH4bczNSE731p/o5W0Qo7K2oCWKsgvYe6pXUv3nJnMTrE
 UsWjzQ1FTcFHG6xvJXHTDIjw+igKNnubnP/jvNOwy7+u
X-Google-Smtp-Source: APXvYqyyXEojYkT80uE5pc7mfnkas5+GBRjBifdwZojvIYuWpuOTKcGHI1oedVEhakdqNTFaVHQZY4kOUHK4CGGRHsM=
X-Received: by 2002:a9d:5605:: with SMTP id e5mr19080105oti.150.1572400099930; 
 Tue, 29 Oct 2019 18:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-4-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-4-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:07 -0600
Message-ID: <CAPnjgZ0rNAtMoaKnQ-6vRp51xJDfE=u15_yg4Xq6Rg32yCcA6A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 03/13] dm: core: add ofnode function to
	iterate on node property
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add functions to iterate on all property with livetree
> - ofnode_get_first_property
> - ofnode_get_next_property
> - ofnode_get_property_by_prop
>
> For example:
> for (prop = ofnode_get_first_property(dev_ofnode(dev));
>      prop;
>      prop = ofnode_get_next_property(dev_ofnode(dev),prop))
> {
>      value = ofnode_get_property_by_prop(dev_ofnode(dev), prop,
>                                          &propname, &len);
> ....
> }
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/core/of_access.c | 32 ++++++++++++++++++++++++++++
>  drivers/core/ofnode.c    | 45 ++++++++++++++++++++++++++++++++++++++++
>  include/dm/of_access.h   | 40 +++++++++++++++++++++++++++++++++++
>  include/dm/ofnode.h      | 39 +++++++++++++++++++++++++++++++++-
>  4 files changed, 155 insertions(+), 1 deletion(-)

Please can you add the dev_read() interface too?  Also need to support
CONFIG_DM_DEV_READ_INLINE in read.h

[..]

> diff --git a/include/dm/of_access.h b/include/dm/of_access.h
> index 13fedb7cf5..0418782aa2 100644
> --- a/include/dm/of_access.h
> +++ b/include/dm/of_access.h
> @@ -103,6 +103,46 @@ struct property *of_find_property(const struct device_node *np,
>  const void *of_get_property(const struct device_node *np, const char *name,
>                             int *lenp);
>
> +/**
> + * of_get_first_property()- get to the pointer of the first property
> + *
> + * Get pointer to the first property of the node, it is used to iterate
> + * and read all the property with of_get_next_property_by_prop().
> + *
> + * @p: Pointer to device node

np

> + * @return pointer to property or NULL if not found
> + */
> +const struct property *of_get_first_property(const struct device_node *np);
> +
> +/**
> + * of_get_next_property() - get to the pointer of the next property
> + *
> + * Get pointer to the next property of the node, it is used to iterate
> + * and read all the property with of_get_property_by_prop().
> + *
> + * @p: Pointer to device node

np

> + * @property: pointer of the current property
> + * @return pointer to next property or NULL if not found
> + */
> +const struct property *of_get_next_property(const struct device_node *np,
> +                                           const struct property *property);
> +
> +/**
> + * of_get_property_by_prop() - get a property value of a node property
> + *
> + * Get value for the property identified by node and property pointer.
> + *
> + * @node: node to read
> + * @property: pointer of the property to read
> + * @propname: place to property name on success

This can be NULL so please document that

> + * @lenp: place to put length on success

This can be NULL so please document that

> + * @return pointer to property value or NULL if error
> + */
> +const void *of_get_property_by_prop(const struct device_node *np,
> +                                   const struct property *property,
> +                                   const char **name,
> +                                   int *lenp);
> +
>  /**
>   * of_device_is_compatible() - Check if the node matches given constraints
>   * @device: pointer to node
> diff --git a/include/dm/ofnode.h b/include/dm/ofnode.h
> index 5c4cbf0998..08d684cea0 100644
> --- a/include/dm/ofnode.h
> +++ b/include/dm/ofnode.h
> @@ -543,7 +543,7 @@ int ofnode_decode_display_timing(ofnode node, int index,
>                                  struct display_timing *config);
>
>  /**
> - * ofnode_get_property()- - get a pointer to the value of a node property
> + * ofnode_get_property() - get a pointer to the value of a node property
>   *
>   * @node: node to read
>   * @propname: property to read
> @@ -552,6 +552,43 @@ int ofnode_decode_display_timing(ofnode node, int index,
>   */
>  const void *ofnode_get_property(ofnode node, const char *propname, int *lenp);
>
> +/**
> + * ofnode_get_first_property()- get to the pointer of the first property
> + *
> + * Get pointer to the first property of the node, it is used to iterate
> + * and read all the property with ofnode_get_property_by_prop().
> + *
> + * @node: node to read
> + * @return pointer or offset to property, used to iterate, or NULL
> + */
> +const void *ofnode_get_first_property(ofnode node);
> +
> +/**
> + * ofnode_get_next_property() - get to the pointer of the next property
> + *
> + * Get pointer to the next property of the node, it is used to iterate
> + * and read all the property with ofnode_get_property_by_prop().
> + *
> + * @node: node to read
> + * @property: pointer or offset of the current property
> + * @return pointer or offset to next property or NULL
> + */
> +const void *ofnode_get_next_property(ofnode node, const void *property);
> +
> +/**
> + * ofnode_get_property_by_prop() - get a pointer to the value of a node property
> + *
> + * Get value for the property identified by node and property.
> + *
> + * @node: node to read
> + * @property: pointer or offset of the property to read

Perhaps you should define an ofprop type for this? It is pretty ugly
to use a pointer.

In fact I wonder if ofprop should be:

struct ofprop {
   ofnode node;
   union {
      int offset;
      struct property *prop;
   };
}


> + * @propname: place to property name on success
> + * @lenp: place to put length on success

These two above can be NULL so please document that

> + * @return pointer to property or NULL if error
> + */
> +const void *ofnode_get_property_by_prop(ofnode node, const void *property,
> +                                       const char **propname, int *lenp);
> +
>  /**
>   * ofnode_is_available() - check if a node is marked available
>   *
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
