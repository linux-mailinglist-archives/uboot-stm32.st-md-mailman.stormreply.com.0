Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAF9569BC8
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:39:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95F15C04005;
	Thu,  7 Jul 2022 07:39:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2845C0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:39:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26715pXG025688;
 Thu, 7 Jul 2022 09:39:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VgoknKlUknHAHmci3Aswjy0zmtCrxLqb6ogkzWNmj2s=;
 b=K2XI2k5x7cuhK/0hvIWYgg1s153/3KNA78CzldM5H2WH14eWgeWVLfEaYf2PZ/ryKayj
 Xv+OYhIePhznLDoR2R0DOgrmS0J7DCnAFzakRxg0UL2kDXfnJEgaFbHuct4o0SDxRQru
 Nt4RgpgJlnsKBZqrerrUa8DnmgGM4c2AMk4H/1+VOWo/mhP5hS1f+sVcomq6jsYjpXLF
 weBzLtSRSs1z/WHza27SpxcxpzYRctA1GQu4Qljvp0qVtecPe39EEPyAFcfT0gnuFEkF
 gtAzVglXs67OuhDwGxZHHXwKeHK/Hk0n6aY8xbHoOeJqz1aM0nCAFYOf7m5/egJzAoVg iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h58bp6xt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:39:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE27110002A;
 Thu,  7 Jul 2022 09:39:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB0A6211F08;
 Thu,  7 Jul 2022 09:39:41 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:39:41 +0200
Message-ID: <d1a7535e-66f1-8e11-8355-c0156aafabf5@foss.st.com>
Date: Thu, 7 Jul 2022 09:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
 <20220630101930.v2.6.Ide5bc18fb9246988ca219eb5b44b865220215a96@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630101930.v2.6.Ide5bc18fb9246988ca219eb5b44b865220215a96@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 06/10] configs: stm32mp13: Add support
 for baudrates higher than 115200
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

On 6/30/22 10:20, Patrick Delaunay wrote:
> On STM32MP13x STMicroelectronics boards, the UART can reliably go up to
> 4000000 bauds when connected to the external ST-LINKV3.
> 
> This patch adds the support of higher baudrates on STMicroelectronics
> STM32MP13x boards with ST-LINKV3.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  include/configs/stm32mp13_st_common.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/configs/stm32mp13_st_common.h b/include/configs/stm32mp13_st_common.h
> index ec64b12f7ab..c51022b40d2 100644
> --- a/include/configs/stm32mp13_st_common.h
> +++ b/include/configs/stm32mp13_st_common.h
> @@ -14,4 +14,9 @@
>  
>  #include <configs/stm32mp13_common.h>
>  
> +/* uart with on-board st-link */
> +#define CONFIG_SYS_BAUDRATE_TABLE      { 9600, 19200, 38400, 57600, 115200, \
> +					 230400, 460800, 921600, \
> +					 1000000, 2000000, 4000000}
> +
>  #endif

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
