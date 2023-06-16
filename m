Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C020373304E
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:46:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87CE5C65E58;
	Fri, 16 Jun 2023 11:46:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6006FC64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:46:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35G8bm0L015734; Fri, 16 Jun 2023 13:46:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WwLcMNTqA9r57ow/BqfUenFn90WXbsgx9Y2zyshWrnw=;
 b=loBsj044U4xoKdFm0GNlkqWf0qmt9gJm6jdPYgiqt9Cn9taTunIRpt5CUmlVCG/aJZCa
 k3Sq9LMUahXQqErtyR4A2qo8uxdhYs4urwdTK8KraanUgWDKaQD2gjBuG3LDwGmcFACm
 kY3LtXG3AfDI1lfRkLOZ/txVrerPADMaQP6ajb3PIjkKIBJtRJX6re1ODvysjCW5ja8D
 1s4vTCGd4dblcjTPL5hD0KSh4Njc7hCUXUA4iJ7TlUAEsbqw7Wxm0aONx+KCkg/TJ8bC
 4UFvD3E2VCsAc3+LVzrbo0bEPEMwRkM58XAGNZMZu1YeLnQ3XfUBSePAE1HdO+uusBuf Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8fj9aup7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:46:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BCF610002A;
 Fri, 16 Jun 2023 13:46:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7438D22FA55;
 Fri, 16 Jun 2023 13:46:08 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:46:08 +0200
Message-ID: <6fa1fdfc-d983-dcb9-7a4c-60055505bc79@foss.st.com>
Date: Fri, 16 Jun 2023 13:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230504195208.4941-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230504195208.4941-1-marex@denx.de>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Use __section(".data") with
 dot in the section name on DHSOM
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



On 5/4/23 21:52, Marek Vasut wrote:
> The correct specifier of the section is ".data" and not "data",
> use the former to place the variables in ".data" section.
> 
> Fixes: 731fd50e27f ("ARM: stm32: Implement board coding on AV96")
> Fixes: 92ca0f7446c ("ARM: dts: stm32: Synchronize DDR setttings on DH SoMs")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  board/dhelectronics/dh_stm32mp1/board.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index a9a2965a386..a0cdf83ea71 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -185,9 +185,9 @@ int checkboard(void)
>  }
>  
>  #ifdef CONFIG_BOARD_EARLY_INIT_F
> -static u8 brdcode __section("data");
> -static u8 ddr3code __section("data");
> -static u8 somcode __section("data");
> +static u8 brdcode __section(".data");
> +static u8 ddr3code __section(".data");
> +static u8 somcode __section(".data");
>  static u32 opp_voltage_mv __section(".data");
>  
>  static void board_get_coding_straps(void)

Applied to u-boot-stm/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
