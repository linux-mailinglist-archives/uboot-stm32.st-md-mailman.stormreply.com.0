Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E9455217A
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 17:46:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65FE2C57B6C;
	Mon, 20 Jun 2022 15:46:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 643C0C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 15:46:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KDag9L025753;
 Mon, 20 Jun 2022 17:46:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pG4YDx2g9l9jkeqg7RCYZZn9FDZEPjWtE8sX6BWE0b8=;
 b=LdYToV2DELDcYK5oLUopw5GzpHWERL6NcgrJvyxXahqWqix9EamKwsmLcGfHG7LCFD3w
 8NTZ9UOB2TsDlbnwoFYbU5Qm1NGm42ax8aS3u43RWCwYrKTge/jRsiu/ZBmRKxvKrIY3
 p+zvOSyLXO3hjx2pY1f8wen0iwF9P+d2uj22OtWfas5fAWWi8PtIokhJbPkX4iiTa29J
 z+8VJqBVy3cvt6hEykCZqcQTLJdCYyqEothp8bqqm6WJUEdu8KJQwpflfDyucg9GvGvL
 y31e44fKJvM8ThMxrakUQ8dRfdmPp7EvafQsgje25yfszN/gjggJtsjsP42j/I2AN4ey aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtntu2jd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 17:46:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A39B010002A;
 Mon, 20 Jun 2022 17:46:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F82822ECDB;
 Mon, 20 Jun 2022 17:46:25 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 17:46:25 +0200
Message-ID: <671901e4-ec08-f51e-e0a9-543a8c59e119@foss.st.com>
Date: Mon, 20 Jun 2022 17:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
 <20220620111707.3.I09a7e6bd976c0720cef2de21e3acd62ff8a7b846@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220620111707.3.I09a7e6bd976c0720cef2de21e3acd62ff8a7b846@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 03/10] stm32mp: add support of STM32MP13x
	Rev.Y
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

On 6/20/22 11:17, Patrick Delaunay wrote:
> Add support of STM32MP13x Rev.Y for the Silicon revision REV_ID = 0x1002.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/include/mach/sys_proto.h | 1 +
>   arch/arm/mach-stm32mp/stm32mp13x.c             | 3 +++
>   2 files changed, 4 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 4b564e86dc5..02debea5469 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -41,6 +41,7 @@ u32 get_cpu_dev(void);
>   
>   #define CPU_REV1	0x1000
>   #define CPU_REV1_1	0x1001
> +#define CPU_REV1_2	0x1002

Bad value for register decoding, REV_ID[15:0]: Silicon revision

as minor version is a bitfield:

#define CPU_REV1_2	0x1003


I will update this value in V2.


>   #define CPU_REV2	0x2000
>   #define CPU_REV2_1	0x2001
>   
> diff --git a/arch/arm/mach-stm32mp/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp13x.c
> index bd3f24c349a..845d973ad1b 100644
> --- a/arch/arm/mach-stm32mp/stm32mp13x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp13x.c
> @@ -126,6 +126,9 @@ void get_soc_name(char name[SOC_NAME_SIZE])
>   	case CPU_REV1_1:
>   		cpu_r = "Z";
>   		break;
> +	case CPU_REV1_2:
> +		cpu_r = "Y";
> +		break;
>   	default:
>   		cpu_r = "?";
>   		break;


Regards


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
