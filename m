Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E065EA6BE
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 15:02:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06676C0D2BB;
	Mon, 26 Sep 2022 13:02:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2752DC035BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 13:02:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QAUYmg001216;
 Mon, 26 Sep 2022 15:02:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KtemMAZ165n1lsBP3Uf2wvGsOWjJTO7aq5srT6s2uoU=;
 b=iKhEt6aS4KFtII4mKmiHNLlZLnaVqFNKtL8rEaOOT0qBqadXzC8sNDovXe25BaKXR4cc
 Qnt+6yaaFWydal7iW9PAVr3mjnGHpWbzmKQnvGi30qfToCWvgYIxA7aq8lkdkl8TdqEA
 MOvmnu6+s1lN4F/5305bl41hIkuaMb1TT3giXwjzkZzvflWtSQKreDJWArntlmbQr9tB
 QgK7fYP8z4GrX3sdZ8UAw5HqBC7JKp3bJc3xFV49Dw0WLJIoGc0UCsv+KjcE0+JbClML
 n0x/6ymlhUp96C8mCroHWjm+XFgsVCywA2D+iIxOm/COzfHyF2yBTTE/GoMlOcymSavP 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjbm8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 15:02:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1AAC10002A;
 Mon, 26 Sep 2022 15:02:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDDFC22A6F1;
 Mon, 26 Sep 2022 15:02:38 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.45) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 15:02:38 +0200
Message-ID: <01128599-d947-0057-9309-5fbd48e15b8e@foss.st.com>
Date: Mon, 26 Sep 2022 15:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-8-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220920160436.117811-8-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/7] configs: stm32f746-disco: Remove
 CONFIG_SYS_UBOOT_START flag
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

On 9/20/22 18:04, Patrice Chotard wrote:
> By pressing "c" key during SPL execution, we force U-boot execution
> instead of a kernel XIP image.
>
> This fixes a hard fault when booting stm32f746-disco in SPL with "c"
> key pressed during SPL execution.
>
> U-Boot SPL 2022.10-rc5-00009-g40d02baa91 (Sep 20 2022 - 17:21:21 +0200)
> Trying to boot from XIP
> Hard fault
> pc : 080083fc    lr : 08000d1b    xPSR : 21000000
> r12 : 2004f108   r3 : 080083fd    r2 : 00000028
> r1 : 2004f0c8    r0 : 2004f0e4
> Resetting CPU ...
>
> This is due to SYS_UBOOT_START flag set to 0x080083FD which is not correct.
> If unset, SYS_UBOOT_START is set by default to CONFIG_SYS_TEXT_BASE
> which match with our requirement.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> (no changes since v1)
>
>   include/configs/stm32f746-disco.h | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
> index 64c1bc7d43..b0ec226114 100644
> --- a/include/configs/stm32f746-disco.h
> +++ b/include/configs/stm32f746-disco.h
> @@ -34,7 +34,6 @@
>   			BOOTENV
>   
>   #define CONFIG_SYS_MONITOR_LEN		(512 * 1024)
> -#define CONFIG_SYS_UBOOT_START		0x080083FD
>   #define CONFIG_SYS_UBOOT_BASE		(CONFIG_SYS_FLASH_BASE + \
>   					 CONFIG_SPL_PAD_TO)
>   



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
