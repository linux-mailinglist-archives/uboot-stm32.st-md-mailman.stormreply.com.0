Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7CF520FF8
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:46:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91893C0D2B9;
	Tue, 10 May 2022 08:46:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EBC5C0D2B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:46:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A7J9Y5015065;
 Tue, 10 May 2022 10:46:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rHPDT52t2k+glr6RNVyuKJVWbphXb2MfJKfeZS38yFE=;
 b=35aHrT1lL7E4nxwQ9LrCpttTaRhfApVREOWBYgY2sqO2l9FK0iBj8ziCfBsC13pDg3mq
 Hb+o3b+dCJg/tu2ASBFQOuNqzM3qebfeTZ9R6U5w/i+VPA233C0n7Q40kLiKvR5Ev5e2
 MjWfvSOCc9KFE+n9+pwWrXdebi2mC7wQNF+8V1UwfQLxHlWGAA9NmtlWK5TcbYC4Euw3
 nYT5S0/Lf0JBP1OPX8io5+C25LeGdbAf6Gx0dWYUMLHnPoxi2YX2NKb3GDcS44bK6Fd8
 S5s8Ue5jWtdLAqDMJC9L59iHKQMwpw56BX8N9rDa//5uLE94Kgh/lXPd1HaScssShw1F wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40xp17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:46:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A99D10002A;
 Tue, 10 May 2022 10:46:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 143E6214D34;
 Tue, 10 May 2022 10:46:43 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:46:42 +0200
Message-ID: <13daabd1-a60e-f346-3ebf-201ac6aeaecb@foss.st.com>
Date: Tue, 10 May 2022 10:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220427115401.155400-1-patrice.chotard@foss.st.com>
 <20220427115401.155400-10-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220427115401.155400-10-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 09/12] configs: stm32f746-disco: use
 CONFIG_DEFAULT_DEVICE_TREE as fdtfile
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



On 4/27/22 13:53, Patrice Chotard wrote:
> As stm32f46-disco, stm32f769-disco and stm32746g-eval are very similar
> except their respective device tree file. These 3 boards uses the same
> TARGET_STM32F746_DISCO flag (so same include/configs/stm32f746-disco.h
> and same board file board/st/stm32f746-disco/stm32f746-disco.c)
> 
> To be able to compile these 3 boards, replace the hard-coded device-tree
> name in include/configs/stm32f746-disco.h by CONFIG_DEFAULT_DEVICE_TREE
> which is set in each board defconfig file with the correct value.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  include/configs/stm32f746-disco.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
> index b93acdcc1f..cc3d4b4449 100644
> --- a/include/configs/stm32f746-disco.h
> +++ b/include/configs/stm32f746-disco.h
> @@ -34,7 +34,7 @@
>  #include <config_distro_bootcmd.h>
>  #define CONFIG_EXTRA_ENV_SETTINGS				\
>  			"kernel_addr_r=0xC0008000\0"		\
> -			"fdtfile=stm32f746-disco.dtb\0"	\
> +			"fdtfile="CONFIG_DEFAULT_DEVICE_TREE".dtb\0"	\
>  			"fdt_addr_r=0xC0408000\0"		\
>  			"scriptaddr=0xC0418000\0"		\
>  			"pxefile_addr_r=0xC0428000\0" \
Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
