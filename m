Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2833A6E5D26
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Apr 2023 11:16:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C77B9C65E70;
	Tue, 18 Apr 2023 09:16:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 662E2C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 09:16:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33I6sfva031180; Tue, 18 Apr 2023 11:16:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8xHN76Joy27oo8m2Ta2ng7tm/ob8ZXo32pD6a2YPtGU=;
 b=OZWF4kPahJsM7JFZ7RLxQEfj+yTQFeh2xOkrzslM6+QicURMCmVAfD5kFGKoIA8fLy+U
 zRu7Y1e4qPjMBpeDzM0W3xDRhg9y7c0EUWR/c1dN0q66VTqXK4yfrDnaSt27PDUUBjqu
 CEXXBvgOzdi808FPv35PW5oxpkcqcL/ZEC5ud4E7MpJCRN6kY3/IR1VKWHikwPmO6aOg
 Ey4zwPCeEjEWTL40LnsRm929atlyxYe9qsdmQGJM5epluUIQqV9r73ax1C6G/cQXNynv
 TMpOrdO9yHVgcAmaDmEbqPB3ymqSY2G6H6dqHbv88tIQu8febKp1nFEEhy3FImzhk4w3 fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q11n10ar7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 11:16:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B02EB100034;
 Tue, 18 Apr 2023 11:14:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9995C215BC9;
 Tue, 18 Apr 2023 11:14:37 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 18 Apr
 2023 11:14:37 +0200
Message-ID: <815f44f9-f6ac-c02d-77c0-bfadc665e808@foss.st.com>
Date: Tue, 18 Apr 2023 11:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230417185558.1.If7ed2ccb5a1c1a84637d29d763cc1935d9b8815e@changeid>
 <d3e391f5-ce85-e5f9-41e4-81e271db8deb@denx.de>
 <f1de64e5-a99c-1eb2-edf5-3f6bd492692e@foss.st.com>
 <a0754b42-9ea4-5b38-1bae-2dd91ceb7f28@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a0754b42-9ea4-5b38-1bae-2dd91ceb7f28@denx.de>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_05,2023-04-17_01,2023-02-09_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: onboard-hub: Don't disable regulator
 in remove() callback
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

Hi Marek

On 4/18/23 10:25, Marek Vasut wrote:
> On 4/18/23 09:21, Patrice CHOTARD wrote:
>> Hi Marek
> 
> Hello Patrice,
> 
>> On 4/17/23 19:00, Marek Vasut wrote:
>>> On 4/17/23 18:56, Patrice Chotard wrote:
>>>> In case USB hub regulator is shared, unexpected behavior occurs.
>>>> On stm32mp135f-dk, stm32mp157c-ev1 and stm32mp157x-dkx, regulator
>>>> v3v3 is shared between several IP/devices (USB, panel, ethernet phy,
>>>> camera, ...).
>>>> Running command "usb stop", v3v3 regulator is switched off and
>>>> the splashscreen content disappear.
>>>>
>>>> v3v3 shouldn't be disabled on usb_onboard_hub_remove() callback.
>>>
>>> Isn't the regulator enable/disable refcounted ?
>>
>> There is no refcount on regulator that's why we let regulator enable.
> 
> Can we add that, instead of hacking around the missing refcount in every driver ?

I agree, it should a nice solution but, there is a but ;-)
 _ it's the same situation for clocks and resets, there is no ref counter.
 _ what about side effects by adding ref counter where some platforms does 
   several enable on the same regulator (or even clock or reset) and only one
   disable on it thinking that it's off ? or introduce new regulator_shared_xxx() API 
   to avoid side-effect with existing code.
 _ unfortunately, currently, i didn't get enough bandwidth to address these points :-(.

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
