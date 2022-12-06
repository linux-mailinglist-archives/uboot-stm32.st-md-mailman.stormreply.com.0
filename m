Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE21643E50
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Dec 2022 09:16:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 341E5C65E6E;
	Tue,  6 Dec 2022 08:16:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 314B8C65E6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 08:16:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B63HoZV023650; Tue, 6 Dec 2022 09:16:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6YLaqrMpYRqq7nUBoat4ATT2yntfwXiWZMrRtX5LJRU=;
 b=IT7Q2F3nWOSAw9dZJmHhmuFrS1F9drpZVZiwRk0Zw4JH22NT2nIk/X7ryHHxFhq/gyLk
 SObT+QW+19OlZZNtd75520/M9v3xIYTHJcExfXBgJp1gQp/VuVcHu++CE3kXeXDkJRJg
 tGgRkqwS8+QKjg8kFKZ/ziPfK6gb5TNusDY23ikjJSP9YRNy2foruttsjBBD/TSpdzg0
 ZbvZ0E/R8CXs8HACV6aARpEjjAuDHuA1xhZMflmU8mfECYDSXcdtLr2qox+VB9HMlVA6
 lYWpHnkFTiFudKLleIbt3i0rh6MCF4OnwQwZkq1sEw4FTJHIFQ4CdF9aLpmiAJp0Fxtv tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7x7pqfn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:16:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5018010002A;
 Tue,  6 Dec 2022 09:16:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 486622138D6;
 Tue,  6 Dec 2022 09:16:45 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 6 Dec
 2022 09:16:44 +0100
Message-ID: <b17a7689-4c9e-38fb-b2c0-d0a644bcdaea@foss.st.com>
Date: Tue, 6 Dec 2022 09:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
 <20221110114828.7.Id632e4ff9cc36841b7ad0b73ccadb2f869aa456e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221110114828.7.Id632e4ff9cc36841b7ad0b73ccadb2f869aa456e@changeid>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_05,2022-12-05_01,2022-06-22_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 7/8] env: mmc: add debug message when
 mmc-env-partition is not found
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



On 11/10/22 11:49, Patrick Delaunay wrote:
> Add a debug message to indicate a potential issue when
> "u-boot,mmc-env-partition" is present in config node of device tree
> but this partition name is not found in the mmc device.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/mmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/env/mmc.c b/env/mmc.c
> index bd7d51e6b633..8941e0f5ff39 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -120,6 +120,7 @@ static inline s64 mmc_offset(int copy)
>  		err = mmc_offset_try_partition(str, copy, &val);
>  		if (!err)
>  			return val;
> +		debug("env partition '%s' not found (%d)", str, err);
>  	}
>  
>  	/* try the GPT partition with "U-Boot ENV" TYPE GUID */

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
