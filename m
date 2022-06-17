Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B52D454F3F5
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 11:10:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69D1DC5F1F2;
	Fri, 17 Jun 2022 09:10:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 310A3C5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 09:10:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H6R3GA027751;
 Fri, 17 Jun 2022 11:10:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=C9V3SDNNS6rVWjeJndpjhdHcoUPxje97MrR++iiHsUE=;
 b=NLswZDOyEdOwgShWP9fWeXQz2hJJKyZ3GtbNbSPsYh1h5orWtcMPL+HU9rcTJD8g+tSt
 N7kDHNlIzVKatSlsYkF+WxjMlXbfZ+PbhbRYmAjwJenog3cdWEE3cXkE1wpxOL2Vaw+r
 BgC9QtwTlHnPEyN4mOdw5QWKlMudy3WoaJFqQ2WG67/4AprnAp3otThsnN1bjE3dNGCX
 M92to8FzWeWZL2zXawb2mfXH516lqQlp4PuUBUn4xbTFDlNpTLnsx5jVj+Llv4pGamef
 4VBAojibmHJwilVXyfciIr0XHeH3C+xMGAxybCsRW/zAyUx7yTwkzvDZrN3rvt8Is9WO AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3grmbw0ym5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 11:10:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D9A110002A;
 Fri, 17 Jun 2022 11:10:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85E4421A22A;
 Fri, 17 Jun 2022 11:10:49 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.117) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 11:10:48 +0200
Message-ID: <1592214c-4ebe-4326-c6a1-faaa39eb8ca5@foss.st.com>
Date: Fri, 17 Jun 2022 11:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220602130535.722317-1-patrick.delaunay@foss.st.com>
 <20220602150254.v3.3.I43cd48cb3b34ee1655bd373e119c9072ef04d8c7@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220602150254.v3.3.I43cd48cb3b34ee1655bd373e119c9072ef04d8c7@changeid>
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] ARM: dts: stm32: add rcc node for
	STM32MP13
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

Hi,

On 6/2/22 15:05, Patrick Delaunay wrote:
> Add the RCC node, not yet in Linux kernel device tree
> to handle the U-Boot RCC drivers with the needed U-Boot
> property "u-boot,dm-pre-reloc" property as the clock and reset drivers
> are required during pre-location.
>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> (no changes since v1)
>
>   arch/arm/dts/stm32mp13-u-boot.dtsi | 4 ++++
>   arch/arm/dts/stm32mp131.dtsi       | 7 +++++++
>   2 files changed, 11 insertions(+)
>

This patch is no more needed, it is dropped until final RCC clock driver 
support

to avoid a probe issue on STM32MP13F-DK board :

stm32-rcc rcc@50000000: Cannot find driver 'stm32mp13_clk'


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
