Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3623062E
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 11:11:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C83E1C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:11:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0496AC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 09:11:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S98M0C014114; Tue, 28 Jul 2020 11:10:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=iJXKp4SxhQE6GmukDv8bmGe0qtwvT7j0eKM8Pb/aVIY=;
 b=JZ2VwkYHnfKdjzFT+MZ2zV5p5X9aXPMpVFUsVou8XKF2sk838wKFrmnys9OsgFeJzTAj
 UDo3vtZkvZmTJRZUWJXe0CKNe9gar73hgZRcnAmJopJeqeabrfAFnotkLJSGtKm0j/U6
 mgFNZLsh6bbB9+qFWfejQ0D0ICKdG0DXKnlSqiKmpzkH+ez0irygJhFVgtT3Sk7pKHQp
 mKlIPAq1OpBscX7UadsPdlU9yKGURyeNAWLHvZmFqfLjc3Ub/lIw34kKn+5nSJQfRjDk
 m+X8uHNB7LJ+4Qu9387Pp+cB+SKSAFsvUJ9AO51IWoYH6dQwSl2YfobM+vnasUO/ydJQ Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71wdt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 11:10:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE01110002A;
 Tue, 28 Jul 2020 11:10:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0B6C2A55EE;
 Tue, 28 Jul 2020 11:10:52 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 11:10:52 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 11:10:52 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v4 1/5] cmd: bind: allow to bind driver with driver data
Thread-Index: AQHWHtcAIOv36kG/d0qeAHl7sm3oN6j81bGAgCBJFIA=
Date: Tue, 28 Jul 2020 09:10:51 +0000
Message-ID: <3ab782f6-81f5-fdde-06e6-f2d8ab35a74f@st.com>
References: <20200430100619.28557-1-patrice.chotard@st.com>
 <20200430100619.28557-2-patrice.chotard@st.com>
 <20200707200859.GA10034@bill-the-cat>
In-Reply-To: <20200707200859.GA10034@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <4E1F222C4F7A8A4BAC6D194F3229538D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/5] cmd: bind: allow to bind driver
	with driver data
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

Hi Tom

On 7/7/20 10:08 PM, Tom Rini wrote:
> On Thu, Apr 30, 2020 at 12:06:15PM +0200, Patrice Chotard wrote:
>
>> Initial implementation invokes device_bind_with_driver_data()
>> with driver_data parameter equal to 0.
>> For driver with driver data, the bind command can't bind
>> correctly this driver or even worse causes data abort as shown below:
>>
>> As example, for debug purpose on STM32MP1 platform, ethernet (dwc_eth_qos.c)
>> driver needed to be unbinded/binded. This driver is using driver data:
>>
>> static const struct udevice_id eqos_ids[] = {
>>     {
>>         .compatible = "nvidia,tegra186-eqos",
>>         .data = (ulong)&eqos_tegra186_config
>>     },
>>     {
>>         .compatible = "snps,dwmac-4.20a",
>>         .data = (ulong)&eqos_stm32_config
>>     },
>>
>>     { }
>> };
>>
>> After unbinding/binding this driver and probing it (with the dhcp command),
>> we got a prefetch abort as below:
>>
>> STM32MP> unbind eth ethernet@5800a000
>> STM32MP> bind /soc/ethernet@5800a000 eth_eqos
>> STM32MP> dhcp
>> prefetch abort
>> pc : [<4310801c>]          lr : [<ffc8f4ad>]
>> reloc pc : [<035ba01c>]    lr : [<c01414ad>]
>> sp : fdaf19b0  ip : ffcea83c     fp : 00000001
>> r10: ffcfd4a0  r9 : fdaffed0     r8 : 00000000
>> r7 : ffcff304  r6 : fdc63220     r5 : 00000000  r4 : fdc5b108
>> r3 : 43108020  r2 : 00003d39     r1 : ffcea544  r0 : fdc63220
>> Flags: nZCv  IRQs off  FIQs off  Mode SVC_32
>> Code: data abort
>> pc : [<ffc4f9c0>]          lr : [<ffc4f9ad>]
>> reloc pc : [<c01019c0>]    lr : [<c01019ad>]
>> sp : fdaf18b8  ip : 00000000     fp : 00000001
>> r10: ffcd69b2  r9 : fdaffed0     r8 : ffcd69aa
>> r7 : 00000000  r6 : 00000008     r5 : 4310801c  r4 : fffffffc
>> r3 : 00000001  r2 : 00000028     r1 : 00000000  r0 : 00000006
>> Flags: NzCv  IRQs on  FIQs on  Mode SVC_32 (T)
>> Code: 2f00 d1e9 2c00 dce9 (f855) 2024
>> Resetting CPU ...
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> Reviewed-by: Simon Glass <sjg@chromium.org>
> Sorry for the delay in getting to this.  Currently, this breaks the dm
> unit tests on sandbox, can you please investigate?  Thanks!
>
A v5 has been submitted fixing the dm unit test regression

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
