Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09864359E81
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 14:22:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEAF6C56639;
	Fri,  9 Apr 2021 12:22:09 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3486C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 12:22:08 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FGy1W5Hxqz1s3jm;
 Fri,  9 Apr 2021 14:22:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FGy1W16Hgz1qqwp;
 Fri,  9 Apr 2021 14:22:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Newzq5d9RPdD; Fri,  9 Apr 2021 14:22:05 +0200 (CEST)
X-Auth-Info: PR8kAs7RSCmd1kW3lx4ve2n6QPe2MsClmX1QjnxBcfY=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  9 Apr 2021 14:22:05 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210409100022.1.I93dea8b89ea632e7d8f2640a6eca6f6e69fed319@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <bf1fcbd0-b54e-b03f-1ac2-27475ee747e2@denx.de>
Date: Fri, 9 Apr 2021 14:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210409100022.1.I93dea8b89ea632e7d8f2640a6eca6f6e69fed319@changeid>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Stephen Warren <swarren@nvidia.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Ramon Fried <rfried.dev@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of device
 tree configuration for reset delay
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 4/9/21 10:00 AM, Patrick Delaunay wrote:
> The gpio reset assert/deassert delay are today harcoded in U-Boot driver
> but the value should be read from DT.
> 
> STM32 use the generic binding defined in linux:
> Documentation/devicetree/bindings/net/ethernet-phy.yaml
> 
>    reset-gpios:
>      maxItems: 1
>      description:
>        The GPIO phandle and specifier for the PHY reset signal.
> 
>    reset-assert-us:
>      description:
>        Delay after the reset was asserted in microseconds. If this
>        property is missing the delay will be skipped.
> 
>    reset-deassert-us:
>      description:
>        Delay after the reset was deasserted in microseconds. If
>        this property is missing the delay will be skipped.
> 
> See also U-Boot: doc/device-tree-bindings/net/phy.txt

Since this is a PHY property, shouldn't that be handled in 
drivers/net/phy/ instead of MAC driver ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
