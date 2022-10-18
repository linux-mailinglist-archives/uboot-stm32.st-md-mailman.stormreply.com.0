Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA38602486
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Oct 2022 08:37:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04C09C640F9;
	Tue, 18 Oct 2022 06:37:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF20BC03FC4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 06:37:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29I2Jh6V022394;
 Tue, 18 Oct 2022 08:37:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q+9xbxDvi4TOV8WGNrTUMQDYkJbBTx9AwhZyL9630ws=;
 b=QLpEeqLIHWiKDjgXEePeq+T/fYyp+/GWjASBlc6TF7M0zHVXCIGsI1RpjJ0xUvHrjMJ+
 E0Ln+2DmZ3wkC3uaUY6j4BsJSLOCZg5umdz60zRISdeLsPeNU9sASJPvUz8J5MyAxQFN
 2KlVteZI2xVnY2ddVW5AtOeIT6p/vuA119r8/iwWRyj8xwDgzXXLOBLd+GloHrWRgqzV
 qCxUJjA+8CYok6/ovODf/a7tfeDK94t7ldTt4Pr2knd4kfwVl08Z875aBPErUSeM+hng
 yNg2HCEeriOKcYTXVrA5IbNiI5BSB5OXEfpJukZjdHc8cTDm3GW4oncythVPRDuNL1eW bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k7j0d29qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Oct 2022 08:37:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 481E3100034;
 Tue, 18 Oct 2022 08:37:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AADA2132CF;
 Tue, 18 Oct 2022 08:37:09 +0200 (CEST)
Received: from [10.201.21.72] (10.201.21.72) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 08:37:08 +0200
Message-ID: <e554134e-2cf4-4d85-8b94-87d6531380cd@foss.st.com>
Date: Tue, 18 Oct 2022 08:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221010105612.1.Iba72bf97918ac926814c68f50c2246f4744f2ab9@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221010105612.1.Iba72bf97918ac926814c68f50c2246f4744f2ab9@changeid>
X-Originating-IP: [10.201.21.72]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_01,2022-10-17_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: update SCMI dedicated
	file
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



On 10/10/22 10:56, Patrick Delaunay wrote:
> The PWR regulators don't need be removed as they are already deactivated.
> This patches is a alignment with the accepted patch in Linux device tree
> in commit a34b42f8690c ("ARM: dts: stm32: fix pwr regulators references
> to use scmi").
> 
> Fixes: 69ef98b209e7 ("ARM: dts: stm32mp15: alignment with v5.19")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-scmi.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15-scmi.dtsi b/arch/arm/dts/stm32mp15-scmi.dtsi
> index 37d4547b3e8..543f24c2f4f 100644
> --- a/arch/arm/dts/stm32mp15-scmi.dtsi
> +++ b/arch/arm/dts/stm32mp15-scmi.dtsi
> @@ -103,7 +103,3 @@
>  /delete-node/ &clk_lse;
>  /delete-node/ &clk_lsi;
>  /delete-node/ &clk_csi;
> -/delete-node/ &reg11;
> -/delete-node/ &reg18;
> -/delete-node/ &usb33;
> -/delete-node/ &pwr_regulators;

Applied on u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
