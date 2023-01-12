Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC916676A7
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 15:34:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB2E6C640EE;
	Thu, 12 Jan 2023 14:34:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA8F8C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 14:34:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CCD1XY010069; Thu, 12 Jan 2023 15:34:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=h36Gp3czgbSKr45c9022ky89FgqChrtzQtDYKM97xSs=;
 b=2H7SpB0DB1sIwNEadlvkvp+hRtiS0B+tHX0Mmqc9P1cGUIanuE0v93EJug2VcKD//vXV
 cpbA7lXcreBEAt98hnV3+BkPuFwJc4HFoYLegYD5NY+MwScfWiSHd/K3WTmFp10ZmwJ2
 gOYFPZczqrIu+MLkMOtnGyGQDfZmNlWyAO5ukJhcelgcjgd30oT4+ifw2lOTomlW+hSo
 owFp98xpS0D3DUn7QtiATE/OhdfUxGNwXLNVQP9DhhFwmWmbbS+MbxfAoDrL2K7lV4KX
 VeSTd3fKQdH84Vqu2YBhriRGYhz27N8TPBKttA/N0hg3eCIAG9Spue6qhRT4bHi06fPG /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1k43k84c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 15:34:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1FC0510002A;
 Thu, 12 Jan 2023 15:34:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4497121A234;
 Thu, 12 Jan 2023 15:34:10 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 15:34:09 +0100
Message-ID: <826ee832-9f89-6220-50b3-7ccb4cf2a24d@foss.st.com>
Date: Thu, 12 Jan 2023 15:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
 <20230106131952.5.I5ced2665787083835d5ce398a3bd10163cca62c9@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230106131952.5.I5ced2665787083835d5ce398a3bd10163cca62c9@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 5/6] board: st: Add support of STM32MP13x
 boards in stm32board cmd
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

On 1/6/23 13:20, Patrick Delaunay wrote:
> Add board identifiers for STMicroelectronics STM32MP13x boards:
> - DISCO board: MB1635
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/common/Kconfig       | 2 +-
>  board/st/common/cmd_stboard.c | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
> index 2f57118bb265..aba3590866e0 100644
> --- a/board/st/common/Kconfig
> +++ b/board/st/common/Kconfig
> @@ -1,7 +1,7 @@
>  config CMD_STBOARD
>  	bool "stboard - command for OTP board information"
>  	depends on ARCH_STM32MP
> -	default y if TARGET_ST_STM32MP15x
> +	default y if TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13x
>  	help
>  	  This compile the stboard command to
>  	  read and write the board in the OTP.
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index 213fb5d30208..853ab78bbf16 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -2,8 +2,8 @@
>  /*
>   * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
>   *
> - * the st command stboard supports the STMicroelectronics board identification
> - * saved in OTP 59.
> + * the command stboard supports the STMicroelectronics board identification
> + * saved in OTP_BOARD.
>   *
>   * The ST product codification have several element
>   * - "Commercial Product Name" (CPN): type of product board (DKX, EVX)
> @@ -18,7 +18,7 @@
>   * - Finished Good = EVA32MP157A1$AU1
>   *
>   * Both information are written on board and these information are also saved
> - * in OTP59, with:
> + * in OTP_BOARD (59 for STM32MP15x or 60 for STM32MP13x), with:
>   * bit [31:16] (hex) => Board id, MBxxxx
>   * bit [15:12] (dec) => Variant CPN (1....15)
>   * bit [11:8]  (dec) => Revision board (index with A = 1, Z = 26)
> @@ -49,6 +49,7 @@ static bool check_stboard(u16 board)
>  		0x1298,
>  		0x1341,
>  		0x1497,
> +		0x1635,
>  	};
>  
>  	for (i = 0; i < ARRAY_SIZE(st_board_id); i++)


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
