Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D323FCC44
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Aug 2021 19:24:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C73C7C57B60;
	Tue, 31 Aug 2021 17:24:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91279C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 17:24:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17VFRv9K013088;
 Tue, 31 Aug 2021 19:24:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zbuTJRc6c3MRECANGxa4dV668McZb3uKKvMeHUn3gLw=;
 b=kcRBq48+GhCBpIfFjoU+jQnAg3eNpjDRsmHN7ce4tf4wOgXOenLATqCfpo6wJc15NDa8
 oCr0s8sAG5PyoaGz0+WOEYfJxeAe4OXqmDW08G4XFaqT45l3k9y9kAvTNi3/jKPFMQoL
 qiYyihMzweipA73HP/fWKiKnBAeAw7XB52QtrVQSuvvm5LWR+H1e/UM2L1wPqgdQamNJ
 /DZtluwxVvZrzpXr6CAJp9sZSkcPzQb6Ni7Er6oqo57lmabesxi3SLuHm1pq+Fb1nQfm
 lbBqOQPAAXKIZOjBangAiGRXHNtk2kvjbjcGXC6kOHoDwD5+Swb98sEGnd8Qr4SbdxXR VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3asc7e4dnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 19:24:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8ABA10002A;
 Tue, 31 Aug 2021 19:24:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB9D12570BB;
 Tue, 31 Aug 2021 19:24:06 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 19:24:06 +0200
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, <u-boot@lists.denx.de>
References: <20210826214209.254461-1-mr.nuke.me@gmail.com>
 <20210826214209.254461-11-mr.nuke.me@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <1afb6206-e2e9-30e7-33f5-695341e88841@foss.st.com>
Date: Tue, 31 Aug 2021 19:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826214209.254461-11-mr.nuke.me@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_08,2021-08-31_01,2020-04-07_01
Cc: marex@denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 10/10] stm32mp1: spl: Copy optee nodes to
 target FDT for OP-TEE payloads
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

On 8/26/21 11:42 PM, Alexandru Gagniuc wrote:
> OP-TEE does not take a devicetree for its own use. However, it does
> pass the devicetree to the normal world OS. In most cases that will
> be some other devicetree-bearing platform, such as linux.
>
> As in other cases where there's an OPTEE payload (e.g. BOOTM_OPTEE),
> it is required to copy the optee nodes to he target's FDT. Do this as
> part of spl_board_prepare_for_optee().
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>   arch/arm/mach-stm32mp/spl.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index d9fdc5926c..94fbb45cf9 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -19,6 +19,7 @@
>   #include <asm/arch/sys_proto.h>
>   #include <mach/tzc.h>
>   #include <linux/libfdt.h>
> +#include <tee/optee.h>
>   
>   u32 spl_boot_device(void)
>   {
> @@ -182,6 +183,7 @@ void stm32_init_tzc_for_optee(void)
>   void spl_board_prepare_for_optee(void *fdt)
>   {
>   	stm32_fdt_setup_mac_addr(fdt);
> +	optee_copy_fdt_nodes(fdt);
>   	stm32_init_tzc_for_optee();
>   }
>   


NAK the OP-TEE nodes are ADDED by the OP-TEE firmware in the unsecure 
device tree (when CFG_DT is activated)

before to jump to the kernel (that remove the need to have DT 
allignement with U-Boot SPL device tree)

=> SPL should not copy the OP-TEE nodes in next stage DT

reference in optee_os = core/arch/arm/kernel/boot.c: add_optee_dt_node()

add_optee_dt_node() <= update_external_dt() <= paged_init_primary()

It is the expected configuration for OP-TEE on STM32MP15 platform.

regards


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
