Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA11898B3
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:59:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43B55C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:59:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F59BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:59:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9x6uR028950; Wed, 18 Mar 2020 10:59:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=HxZJ785+vO5vHVsu0vUZ0nfU0hHQCjWYDiOkHEjhXQE=;
 b=Px7Q8mpv7O3M1nOhL1Z1de8vCigNueAZJ/Dj9kpPs0uslLIz7ujq74iVPnW27xqUE9OF
 FJLVNvYFT+NuFFdffZNFiBRQIZkQfhdDc0bJZGTx6Y5y2NAAVAVUc4CyM71lw7j5MT2l
 DEYughMiXBYuHPNavR7VkJqzL3fRxwrx/DPEAUUOYHymj/fho3XrFRHmGVRHCGIUhusO
 Io9hluy750VJ569fUx3Wwybtgk1mTLJe9t5b6gGD7UyQ8K9pwr1aAVMx9wcrUTi/yyQB
 h1CYLiddK2vyau67otI4wAjavbPpzhh7JYHtqpcNzCzMtwELTd+YPM2kitUFg29L2eTi JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4wac8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:59:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D2C3100034;
 Wed, 18 Mar 2020 10:58:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1273F21F67C;
 Wed, 18 Mar 2020 10:58:47 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 10:58:46 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:58:46 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp: psci: set cntfrq register of cpu on
Thread-Index: AQHV8H0fy+ltsLkoNE+jf8WF6fIt/qhOJeMA
Date: Wed, 18 Mar 2020 09:58:46 +0000
Message-ID: <0dc2038c-32c3-cd15-2f66-809cab33a948@st.com>
References: <20200302102702.6917-1-patrick.delaunay@st.com>
In-Reply-To: <20200302102702.6917-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <97F28D69131BE04B95B6A3A4C0466890@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: psci: set cntfrq register of cpu
	on
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


On 3/2/20 11:27 AM, Patrick Delaunay wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
>
> This path allows to set the cntfrq register of targeted cpu.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/psci.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/psci.c
> index 1d91b2d324..3fb038d3e7 100644
> --- a/arch/arm/mach-stm32mp/psci.c
> +++ b/arch/arm/mach-stm32mp/psci.c
> @@ -30,6 +30,22 @@ u8 psci_state[STM32MP1_PSCI_NR_CPUS] __secure_data = {
>  	 PSCI_AFFINITY_LEVEL_ON,
>  	 PSCI_AFFINITY_LEVEL_OFF};
>  
> +static u32 __secure_data cntfrq;
> +
> +static u32 __secure cp15_read_cntfrq(void)
> +{
> +	u32 frq;
> +
> +	asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r" (frq));
> +
> +	return frq;
> +}
> +
> +static void __secure cp15_write_cntfrq(u32 frq)
> +{
> +	asm volatile ("mcr p15, 0, %0, c14, c0, 0" : : "r" (frq));
> +}
> +
>  static inline void psci_set_state(int cpu, u8 state)
>  {
>  	psci_state[cpu] = state;
> @@ -63,6 +79,9 @@ void __secure psci_arch_cpu_entry(void)
>  
>  	psci_set_state(cpu, PSCI_AFFINITY_LEVEL_ON);
>  
> +	/* write the saved cntfrq */
> +	cp15_write_cntfrq(cntfrq);
> +
>  	/* reset magic in TAMP register */
>  	writel(0xFFFFFFFF, TAMP_BACKUP_MAGIC_NUMBER);
>  }
> @@ -130,6 +149,9 @@ s32 __secure psci_cpu_on(u32 function_id, u32 target_cpu, u32 pc,
>  	if (psci_state[cpu] == PSCI_AFFINITY_LEVEL_ON)
>  		return ARM_PSCI_RET_ALREADY_ON;
>  
> +	/* read and save cntfrq of current cpu to write on target cpu  */
> +	cntfrq = cp15_read_cntfrq();
> +
>  	/* reset magic in TAMP register */
>  	if (readl(TAMP_BACKUP_MAGIC_NUMBER))
>  		writel(0xFFFFFFFF, TAMP_BACKUP_MAGIC_NUMBER);

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

PAtrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
