Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA342648E
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:21:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 833E6C597B2;
	Fri,  8 Oct 2021 06:21:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0AEDC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:21:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZGYL032602; 
 Fri, 8 Oct 2021 08:21:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tl+ze1pfQAI50/e8u7J4L2kOlyleoK+wyCG4zzFEbqI=;
 b=EXuueb2Y9DhYElgcTIQ6QK3ExQspx2cw56lE5mDC/okU0iiybm4m/XFyIP90gi0lGwpd
 56Jq1xbwdFUQRMK37zoT8ZsI7iUFu6Wg688+dRhar7I7LgtJR/LrYl6ADI6yuyL1RzE9
 5NMzZyq1LQ+wp5iAC/Vp32U6tpjUBcbudss6g8dDOrE6UwNJdA9NnRyJlElqkWlkaF/+
 jaPTeLNy5CGMBQZIYXe6013Kmoj5aIrjxkBzFSkxjnLP7t+Y61QnqBRISwTAeBW8UC95
 QK9jwYEO+0GVY/detbu5x6OzON5Q9C8bKu4lwETk9qr+J8ovyv0N1twkdty7CjVsTiqb aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjem10ncw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:21:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 650BD10002A;
 Fri,  8 Oct 2021 08:21:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C61F2138D1;
 Fri,  8 Oct 2021 08:21:13 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:21:12 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210914143026.1.I48db0a17460592df70f33306da8d8196cd13e0e9@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <b2ddcc92-a308-24a2-d44e-40942c491df5@foss.st.com>
Date: Fri, 8 Oct 2021 08:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914143026.1.I48db0a17460592df70f33306da8d8196cd13e0e9@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] phy: stm32-usbphyc: use connector for
 vbus-supply with phy-stm32-usbphyc
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

Hi Patrick

On 9/14/21 2:31 PM, Patrick Delaunay wrote:
> The vbus-supply is an optional property of sub-node connector node.
> and no more in the usb phyc node (in first proposed binding).
> 
> This regulator for USB VBUS may be needed for host mode.
> 
> See the latest kernel binding for details in
> Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml.
> 
>   usbphyc_port0: usb-phy@0 {
>       reg = <0>;
>       phy-supply = <&vdd_usb>;
>       #phy-cells = <0>;
>       connector {
>           compatible = "usb-a-connector";
>           vbus-supply = <&vbus_sw>;
>       };
>   };
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/phy/phy-stm32-usbphyc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
> index 02d859a039..c206efd28d 100644
> --- a/drivers/phy/phy-stm32-usbphyc.c
> +++ b/drivers/phy/phy-stm32-usbphyc.c
> @@ -339,7 +339,7 @@ static int stm32_usbphyc_probe(struct udevice *dev)
>  {
>  	struct stm32_usbphyc *usbphyc = dev_get_priv(dev);
>  	struct reset_ctl reset;
> -	ofnode node;
> +	ofnode node, connector;
>  	int i, ret;
>  
>  	usbphyc->base = dev_read_addr(dev);
> @@ -395,10 +395,12 @@ static int stm32_usbphyc_probe(struct udevice *dev)
>  			return ret;
>  		}
>  
> -		ret = stm32_usbphyc_get_regulator(node, "vbus-supply",
> -						  &usbphyc_phy->vbus);
> -		if (ret)
> -			usbphyc_phy->vbus = NULL;
> +		usbphyc_phy->vbus = NULL;
> +		connector = ofnode_find_subnode(node, "connector");
> +		if (ofnode_valid(connector)) {
> +			ret = stm32_usbphyc_get_regulator(connector, "vbus-supply",
> +							  &usbphyc_phy->vbus);
> +		}
>  
>  		node = dev_read_next_subnode(node);
>  	}
> 

Applied on u-boot-stm32 for next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
