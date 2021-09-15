Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A640C1E0
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Sep 2021 10:36:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04E34C597BE;
	Wed, 15 Sep 2021 08:36:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A464C597BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Sep 2021 08:36:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F8680q001466; 
 Wed, 15 Sep 2021 10:36:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FkpBy4W+wC5LdmZiLqK/oaENjLvWg//L59qRyyBgvjk=;
 b=T3noe1lwFx0HzYaYsCiveUeD3KXIOTW1I8hORr3h4su0UPClhcwdp1PFFfn1skiaZBKE
 k+wcF1AJDFJrDtMktQWdZX/S4psT/wgtvZA4CzbUubPuWlR6wh6aYgDn0QNpDdlLiR2i
 4Fro7BTjmXoI0LN56TO/4hTgxx1UE9mz2JdBFz2w4uEEo+OhEBWN5BzDiHDDXuRwDWPw
 M0TiwyeB1ztGkuq4brNtTBNRuzdFDavbBXgHIvcYqvR+vOzg4Y6ZS57jEDXhHswYbmgF
 T6dCz24Apisqkp241y/zeurX4JSsvSE7heLM1bm75o97bSf1WbXOQGxWs7R/IdVaiFJ7 AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b3d1986jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 10:36:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 019EB10002A;
 Wed, 15 Sep 2021 10:36:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBB7A212303;
 Wed, 15 Sep 2021 10:36:21 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 15 Sep
 2021 10:36:21 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210914143026.1.I48db0a17460592df70f33306da8d8196cd13e0e9@changeid>
 <20210914143026.2.I38b706ca6f52e86cb791245a2aee6a81fbd1c030@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6a4ca7e2-fabd-7b08-58e2-6b54477c592e@foss.st.com>
Date: Wed, 15 Sep 2021 10:36:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914143026.2.I38b706ca6f52e86cb791245a2aee6a81fbd1c030@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_01,2021-09-14_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] phy: stm32-usbphyc: stm32: usbphyc:
 add protection on phy sub-node
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

HI Patrick

On 9/14/21 2:31 PM, Patrick Delaunay wrote:
> Add protection on presence and order of the phy node sub node
> by using the mandatory reg information.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/phy/phy-stm32-usbphyc.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
> index c206efd28d..9c1dcfae52 100644
> --- a/drivers/phy/phy-stm32-usbphyc.c
> +++ b/drivers/phy/phy-stm32-usbphyc.c
> @@ -340,7 +340,7 @@ static int stm32_usbphyc_probe(struct udevice *dev)
>  	struct stm32_usbphyc *usbphyc = dev_get_priv(dev);
>  	struct reset_ctl reset;
>  	ofnode node, connector;
> -	int i, ret;
> +	int ret;
>  
>  	usbphyc->base = dev_read_addr(dev);
>  	if (usbphyc->base == FDT_ADDR_T_NONE)
> @@ -378,14 +378,18 @@ static int stm32_usbphyc_probe(struct udevice *dev)
>  		return ret;
>  	}
>  
> -	/*
> -	 * parse all PHY subnodes in order to populate regulator associated
> -	 * to each PHY port
> -	 */
> -	node = dev_read_first_subnode(dev);
> -	for (i = 0; i < MAX_PHYS; i++) {
> -		struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + i;
> +	/* parse all PHY subnodes to populate regulator associated to each PHY port */
> +	dev_for_each_subnode(node, dev) {
> +		fdt_addr_t phy_id;
> +		struct stm32_usbphyc_phy *usbphyc_phy;
>  
> +		phy_id = ofnode_read_u32_default(node, "reg", FDT_ADDR_T_NONE);
> +		if (phy_id >= MAX_PHYS) {
> +			dev_err(dev, "invalid reg value %lx for %s\n",
> +				phy_id, ofnode_get_name(node));
> +			return -ENOENT;
> +		}
> +		usbphyc_phy = usbphyc->phys + phy_id;
>  		usbphyc_phy->init = false;
>  		usbphyc_phy->powered = false;
>  		ret = stm32_usbphyc_get_regulator(node, "phy-supply",
> @@ -401,8 +405,6 @@ static int stm32_usbphyc_probe(struct udevice *dev)
>  			ret = stm32_usbphyc_get_regulator(connector, "vbus-supply",
>  							  &usbphyc_phy->vbus);
>  		}
> -
> -		node = dev_read_next_subnode(node);
>  	}
>  
>  	/* Check if second port has to be used for host controller */
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
