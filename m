Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C087162D77
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 18:53:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB344C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 17:53:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D239C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 17:53:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48MT3n69lFz1qrLg;
 Tue, 18 Feb 2020 18:53:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48MT3n5JwYz1qqkc;
 Tue, 18 Feb 2020 18:53:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 34ndMDtjV6O5; Tue, 18 Feb 2020 18:53:24 +0100 (CET)
X-Auth-Info: BQyubNTmLKQGi+bLn1Eh1S+rQqSctsJKYbTRBFOWkbY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 18 Feb 2020 18:53:24 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200218083836.6369-1-patrick.delaunay@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <8bd74f07-98a0-4ca7-d189-a55c01ce08a1@denx.de>
Date: Tue, 18 Feb 2020 18:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218083836.6369-1-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/8] phy: generic: add error trace to
 detect PHY issue in uclass
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

On 2/18/20 9:38 AM, Patrick Delaunay wrote:
[...]
>  static inline struct phy_ops *phy_dev_ops(struct udevice *dev)
>  {
> @@ -109,56 +110,86 @@ int generic_phy_get_by_name(struct udevice *dev, const char *phy_name,
>  int generic_phy_init(struct phy *phy)
>  {
>  	struct phy_ops const *ops;
> +	int ret;
>  
>  	if (!phy)
>  		return 0;
>  	ops = phy_dev_ops(phy->dev);
>  
> -	return ops->init ? ops->init(phy) : 0;
> +	ret = ops->init ? ops->init(phy) : 0;

if (!ops->init)
   return 0;
ret = ops->init();
if (ret)
   dev_err...

return ret;

Please fix globally.

> +	if (ret)
> +		dev_err(phy->dev, "PHY: Failed to init %s: %d.\n",
> +			phy->dev->name, ret);
> +
> +	return ret;
[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
