Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF36E748D
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Apr 2023 10:01:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16ADFC6B460;
	Wed, 19 Apr 2023 08:01:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2E42C6B456
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 08:01:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J3RIei029244; Wed, 19 Apr 2023 10:01:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xGzViRPXsrm3TcNxxcpt1NUz7PLoYATQDHcCex7xy/c=;
 b=2V+7TNmaOUJIe7kJmrgT1JDTjmhjFgPil4/IB6caRn+a6rc7KoivWfkuU+4rpwcyQ4WR
 cyfwBJaEBFwK42ZvTePI5YnMb1QMumdjFhN5TIMGba0Bc72nEtlZiLVdhBj4GdHBJyYH
 hPdBjuOWhpUDIs9GbKDwdAvhlnkoy+rEKpAMli4R+aflTaKwCgYZEfAFt7eHc8ZYE/48
 5VgWkURUIeKyBxnWmGL9b5/DoXcgvUitU/gi9q22AxcM43PIU6aCPbpomIIuN9nKj9QQ
 A4w97LL+bpHqEso6Jm9vDglddzlJs949P7XNyHzvBE9YvRX88kfEL3bOjdIhrcLJY3Hf Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1qf7ft8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 10:01:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C7D410002A;
 Wed, 19 Apr 2023 10:01:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42BAA211F3F;
 Wed, 19 Apr 2023 10:01:17 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Apr
 2023 10:01:16 +0200
Message-ID: <33383505-d121-8a96-673b-082ad0d1e9a1@foss.st.com>
Date: Wed, 19 Apr 2023 10:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>, <u-boot@lists.denx.de>
References: <20230330091621.350840-1-christophe.kerello@foss.st.com>
 <5e669d01-3065-bdcd-af5e-3ed66edeb718@foss.st.com>
In-Reply-To: <5e669d01-3065-bdcd-af5e-3ed66edeb718@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_04,2023-04-18_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] mtd: rawnand: stm32_fmc2: remove
	unsupported EDO mode
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



On 4/11/23 08:53, Patrice CHOTARD wrote:
> Hi Christophe
> 
> On 3/30/23 11:16, Christophe Kerello wrote:
>> Remove the EDO mode support from as the FMC2 controller does not
>> support the feature.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> ---
>>
>>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> index fb3279b405e..69dbb629e93 100644
>> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> @@ -735,6 +735,9 @@ static int stm32_fmc2_nfc_setup_interface(struct mtd_info *mtd, int chipnr,
>>  	if (IS_ERR(sdrt))
>>  		return PTR_ERR(sdrt);
>>  
>> +	if (sdrt->tRC_min < 30000)
>> +		return -EOPNOTSUPP;
>> +
>>  	if (chipnr == NAND_DATA_IFACE_CHECK_ONLY)
>>  		return 0;
>>  
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice



Applied on u-boot-stm/master, thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
