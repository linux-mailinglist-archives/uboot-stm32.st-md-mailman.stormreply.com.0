Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4B39BDF8
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Jun 2021 19:04:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC05C57B69;
	Fri,  4 Jun 2021 17:04:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2AB3C57B55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 17:04:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154H3QZT008440; Fri, 4 Jun 2021 19:04:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0FiCRTMYCvjdGHlj6snYjG98FThrdGrLiA/TUKm+g5E=;
 b=wqtkjTJKxVfr8t2ZAzoX5XRlZ9h+jh+yrYBFIJA9A0QCdb4pcUYVnKY6VyzckerFibHn
 DbKvUJ1y+nvkRMR9SdWT0G4DJsEMXr7pZpHymgDzFJNY7JNifo6Nbqm44t76pGeQ5420
 tkTzz/oBgcKxmGXNNncbNXS/kIh4dB8hJ0waHnaaPGSGn16YzydTWxNRDlu8lQe+V35T
 G7nny7p0iiXIxw3tsHDLn8atvAaoB4CwvoKr94XHbVsubpwW2Vya2UH3t/CRGRIYa5sH
 N2HZyNzaZVc3HR8Pubx31AfeF05f3PY8W2VzXECHyQ3wnwQ34ZJNMmmFQRHIY/MDaQHn 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38yea1kmsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 19:04:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D04C410002A;
 Fri,  4 Jun 2021 19:03:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6432F248EF9;
 Fri,  4 Jun 2021 19:03:56 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 19:03:54 +0200
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224124843.12648-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <a5f5999b-a0ab-11c2-fcb2-2ac47b7c7c3e@foss.st.com>
Date: Fri, 4 Jun 2021 19:03:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224124843.12648-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_11:2021-06-04,
 2021-06-04 signatures=0
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Fleming <afleming@gmail.com>, Stefan Roese <sr@denx.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek
 Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>, Daniel
 Schwierzeck <daniel.schwierzeck@gmail.com>, Angelo
 Dureghello <angelo@sysam.it>, Masahiro Yamada <masahiroy@kernel.org>,
 Macpaul Lin <macpaul@andestech.com>, Thomas Chou <thomas@wytron.com.tw>,
 Scott McNutt <smcnutt@psyent.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Alison Wang <alison.wang@nxp.com>,
 Michal Simek <monstr@monstr.eu>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Mario Six <mario.six@gdsys.cc>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] arch: cache: cp15: Add
 mmu_set_region_dcache_behaviour() when SYS_DCACHE_OFF is enable
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

Hi Patrice,

On 2/24/21 1:48 PM, Patrice Chotard wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
>
> Fix following compilation issue when SYS_DCACHE_OFF is enable:
> drivers/misc/scmi_agent.c:128: undefined reference to `mmu_set_region_dcache_behaviour'
>
> when SYS_DCACHE_OFF is enable, mmu_set_region_dcache_behaviour() must be
> defined.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/lib/cache-cp15.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
> index 24050e5bdd..f1703ead96 100644
> --- a/arch/arm/lib/cache-cp15.c
> +++ b/arch/arm/lib/cache-cp15.c
> @@ -97,12 +97,6 @@ void mmu_set_region_dcache_behaviour_phys(phys_addr_t start, phys_addr_t phys,
>   	mmu_page_table_flush(startpt, stoppt);
>   }
>   
> -void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
> -				     enum dcache_option option)
> -{
> -	mmu_set_region_dcache_behaviour_phys(start, start, size, option);
> -}
> -
>   __weak void dram_bank_mmu_setup(int bank)
>   {
>   	struct bd_info *bd = gd->bd;
> @@ -314,6 +308,12 @@ int dcache_status(void)
>   {
>   	return 0;					/* always off */
>   }
> +
> +void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
> +				     enum dcache_option option)
> +{
> +}
> +
>   #else
>   void dcache_enable(void)
>   {
> @@ -329,4 +329,10 @@ int dcache_status(void)
>   {
>   	return (get_cr() & CR_C) != 0;
>   }
> +
> +void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
> +				     enum dcache_option option)
> +{
> +	mmu_set_region_dcache_behaviour_phys(start, start, size, option);
> +}
>   #endif


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
