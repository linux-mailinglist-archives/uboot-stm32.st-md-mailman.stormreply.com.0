Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 527FE569BD0
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:43:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CCE3C640F5;
	Thu,  7 Jul 2022 07:43:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27378C640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:43:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675rEdi030892;
 Thu, 7 Jul 2022 09:43:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bdM/AAFs7Y9+20cOQejInH3fjODn1bBLneBGChMAiaU=;
 b=3QWH156ZzTVsbVQAT+tXbzVmKGVHLjYfeCIu+2uY7MzzQVCT2/LfJ/AM3yoGNDJ3lbLi
 6CttHOEQ00QXKwNQcPenUcckl32cF9CBjNUGbPJU2B0wZzHCkyoPC8L3s+u2+2Ddwd9N
 kxkniEoussmvCag204mKWMGALMjxPJY9+1sqx4Rn6YCnLG1syKAkbqzuQIooeCPzmc/s
 LwnlEw69jHwLReim4YZ1/qUwfmtKUcbXDF7QkX0y2Dq9ifkNGlqi6DWOkYPdyj1qCvrf
 ox4c58TgWXmpykBEPw8vlSyikRBy0tMunDFZKWM1vgbbT/cYRliwnXobz1nGoqHiDqy8 pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4uadjyu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:43:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C93B910002A;
 Thu,  7 Jul 2022 09:43:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5B6D210F8B;
 Thu,  7 Jul 2022 09:43:12 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:43:12 +0200
Message-ID: <791a5c30-3f8c-49d5-29c8-c279240d5b75@foss.st.com>
Date: Thu, 7 Jul 2022 09:43:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
 <20220705165545.3.Ia0aa1dcca7e4958830461ea4304b5826049f38aa@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220705165545.3.Ia0aa1dcca7e4958830461ea4304b5826049f38aa@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] configs: stm32mp15: increase malloc
 size for pre-reloc
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

On 7/5/22 16:55, Patrick Delaunay wrote:
> With support of SCMI in OP-TEE, the early malloc usage
> increase, the associated defined CONFIG_SYS_MALLOC_F_LEN
> need to be increased.
> 
> For example, for stm32mp15_defconfig and
> stm32mp157c-dk2-scmi.dtsi, we have:
> 
> Early malloc usage: 14098 / 80000
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index 48185d32baa..76b187bead1 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -1,7 +1,7 @@
>  CONFIG_ARM=y
>  CONFIG_ARCH_STM32MP=y
>  CONFIG_TFABOOT=y
> -CONFIG_SYS_MALLOC_F_LEN=0x3000
> +CONFIG_SYS_MALLOC_F_LEN=0x20000
>  CONFIG_ENV_OFFSET=0x480000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
