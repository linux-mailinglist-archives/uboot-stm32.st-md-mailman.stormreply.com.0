Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E0B1814D
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Aug 2025 13:47:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D08D8C36B14;
	Fri,  1 Aug 2025 11:47:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0219C36B12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Aug 2025 11:47:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571AdqO0032356;
 Fri, 1 Aug 2025 13:47:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 I4SdMSWR+dZ6/uXR7JrxjlwQ8tEfEC9EqO5IHgIgVzY=; b=RSmhEjprpCDe8uNf
 MfqQV5xJM6AwJ6f4IxdpQloASv95xeIlII+DXp7oyMIBaTFp3e4l52bsJPwgNc8K
 K6RayTJ6m11HjxfuGS2BfAskDjOTKbVLLF73fcE3t9Rbt82kb2XopSbIjPM8Aoyz
 fDDoicmOWNESK4LjrKXRkCCREuDuT7GiZh0vAefCcmZhY4DPg8MYQZQ31XFdtPOD
 IvqBbz8fuavscIFJs/FKP9AazPGfOXKCj2v3nDOgmK9vl08uamux7Ocntdfcsf1t
 /z4Xk1wVctRF4xBZXA3pyJ6Wshr6wDof1H2hGIrH5qTft39Vtst639mfPs2jSF4c
 zxbZDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484men4a1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Aug 2025 13:47:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A8CF14004F;
 Fri,  1 Aug 2025 13:46:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7707E78EA77;
 Fri,  1 Aug 2025 13:46:31 +0200 (CEST)
Received: from [10.252.19.251] (10.252.19.251) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 13:46:30 +0200
Message-ID: <93cd38b2-019c-4d4a-919d-11819341119a@foss.st.com>
Date: Fri, 1 Aug 2025 13:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Goodbody <andrew.goodbody@linaro.org>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>, Michael Trimarchi
 <michael@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, Patrick
 Delaunay <patrick.delaunay@foss.st.com>
References: <20250801-mtd_nand_raw2-v1-0-bdabdeb35b46@linaro.org>
 <20250801-mtd_nand_raw2-v1-2-bdabdeb35b46@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250801-mtd_nand_raw2-v1-2-bdabdeb35b46@linaro.org>
X-Originating-IP: [10.252.19.251]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 2/3] mtd: rawnand: stm32_fmc2: Ensure to
	return error code
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



On 8/1/25 12:39, Andrew Goodbody wrote:
> In stm32_fmc2_nfc_probe there are 3 error returns that do not set the
> error code before returning which could lead to the error being silently
> ignored. Just return -EINVAL in each case.
> 
> This issue was found by Smatch.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> ---
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 083ea4c5a74..d1c88643c98 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -942,21 +942,21 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  		addr = dev_read_addr_index(dev, mem_region);
>  		if (addr == FDT_ADDR_T_NONE) {
>  			dev_err(dev, "Resource data_base not found for cs%d", chip_cs);
> -			return ret;
> +			return -EINVAL;
>  		}
>  		nfc->data_base[chip_cs] = addr;
>  
>  		addr = dev_read_addr_index(dev, mem_region + 1);
>  		if (addr == FDT_ADDR_T_NONE) {
>  			dev_err(dev, "Resource cmd_base not found for cs%d", chip_cs);
> -			return ret;
> +			return -EINVAL;
>  		}
>  		nfc->cmd_base[chip_cs] = addr;
>  
>  		addr = dev_read_addr_index(dev, mem_region + 2);
>  		if (addr == FDT_ADDR_T_NONE) {
>  			dev_err(dev, "Resource addr_base not found for cs%d", chip_cs);
> -			return ret;
> +			return -EINVAL;
>  		}
>  		nfc->addr_base[chip_cs] = addr;
>  	}
> 

Hi Andrew

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
