Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B1B199833
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:10:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22806C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 14:10:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 181ABC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 14:10:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VE8jAe031146; Tue, 31 Mar 2020 16:10:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9PUuENrk+Q9UaekhBL9DUAIZ+7k5qTVkAULDvdSz02I=;
 b=yl349yCtkXIGK1HOTdJMjdSJm6s1EVIRWDs9cyUjoEHKUrxgujcD7Z4ugstFOfDJkpwy
 gBPROviash4OHidsPA6cxogJTnbMxl5UOz7MiCDQdz8P+6FsUCHls2VBris+a81MeaS/
 O7VznPWEXnyTniOESA3/whmTn6KIpWDtAfxCgIYNsvfH1JBondlDjMLSGly20WxbTZk8
 7VGDacVYa5vqUqKk+hHrb3CImWCLQC91cB77OLH3dH1SIrt4qeBLHprjqfryLZL78b/u
 Qo7+UmqEWUTe+ZG88En2ofbNL8quXPELMAGn1NLbIsEG/z7jA1ny0+SN4bpfvr3E1agC SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbmfdm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 16:10:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67E96100034;
 Tue, 31 Mar 2020 16:10:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C88E2B3A50;
 Tue, 31 Mar 2020 16:10:32 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 31 Mar
 2020 16:10:31 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 31 Mar 2020 16:10:31 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [U-Boot] [PATCH v1 2/2] gpio: stm32f7: Fix SPL code size
Thread-Index: AQHUpBOj29VrtwyoLkGyFoF3y5YE8qhkpO4AgABZigCAADVMgIAALtOA
Date: Tue, 31 Mar 2020 14:10:31 +0000
Message-ID: <c0c7ba79-763e-3096-fbe6-f97e9f076592@st.com>
References: <1546595706-31360-1-git-send-email-patrice.chotard@st.com>
 <1546595706-31360-3-git-send-email-patrice.chotard@st.com>
 <f3e23915-c6ae-7c4d-7c5a-f725f726b5d4@denx.de>
 <ed1f23e8-6ae1-4f62-cb23-10f8061a45d1@st.com>
 <08d1a5d5-4d90-1c97-6e88-b44391bc0fe0@denx.de>
In-Reply-To: <08d1a5d5-4d90-1c97-6e88-b44391bc0fe0@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <09F127C5F64C2D43A8EFBE3ABB90F34C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_04:2020-03-31,
 2020-03-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v1 2/2] gpio: stm32f7: Fix SPL
	code size
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


On 3/31/20 1:22 PM, Marek Vasut wrote:
> On 3/31/20 10:12 AM, Patrice CHOTARD wrote:
>> Hi Marek
> Hi,
>
>> On 3/31/20 4:51 AM, Marek Vasut wrote:
>>> On 1/4/19 10:55 AM, Patrice Chotard wrote:
>>>
>>> Hi,
>>>
>>>> @@ -215,7 +220,9 @@ U_BOOT_DRIVER(gpio_stm32) = {
>>>>  	.id	= UCLASS_GPIO,
>>>>  	.of_match = stm32_gpio_ids,
>>>>  	.probe	= gpio_stm32_probe,
>>>> +#ifndef CONFIG_SPL_BUILD
>>>>  	.ops	= &gpio_stm32_ops,
>>>> +#endif
>>>>  	.flags	= DM_UC_FLAG_SEQ_ALIAS,
>>>>  	.priv_auto_alloc_size	= sizeof(struct stm32_gpio_priv),
>>>>  };
>>> The U-Boot DM GPIO uclass code assumes the .ops is always non-NULL.
>>> Hence, this patch breaks all GPIO access (actually crashes SPL) on STM32
>>> in SPL.
>> I suppose it breaks AV96 boot ?
> No, it does not. I was trying to read GPIO value in SPL and found this.
>
>> On my side i have checked on v2020-04-rc4 U-boot release, by reverting "gpio: stm32f7: Fix SPL code size"
>>
>> the stm32f7 SPL code size is below the 32Kb limit.
>>
>> I will send a patch to revert it.
> OK sure, does that apply to all the STM32 systems ?
Yes, all STM32 based platforms (F4/F7/H7 and MP1) are using this gpio driver.
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
