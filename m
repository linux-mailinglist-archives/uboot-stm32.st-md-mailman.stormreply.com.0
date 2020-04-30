Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 003771BF37E
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 10:50:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B19CCC36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 08:50:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDA35C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 08:50:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U8gZdK017013; Thu, 30 Apr 2020 10:50:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=75ba1L94MgC/hqSwtR3P4NSS/bzU/M15GQ9i04L0yFE=;
 b=EiunZlH3AZCBN0NvP3L5gZVVDHXzxMpX5PJ9gSTcLL3E69lVubYfFli/24n6Q5NEi9Zi
 NG8unQ2iBgs8VmK2IlQs3Qdv3CXNP8c4dqKX7PDswNeftYm3GxyD5QofIlUrLCYG9jTn
 1zEvv1lIdYVoXXK1HU9CWlx/ItM4hc5tZbyRGBLrpKZ+YDCh6fNDBIz259t10Lt+5wID
 9VY0WsLlmqigkX6WviRU6HBwmJtC24oBlXTpW94+JcyFJGLgoZdRn4XNk5R99uIeHSxK
 L5de9D3UcxCyx6nQEruSfQRky+EjeBEBpoYgFH9fES0YOWp4LwgxB9+oUeu1smMEyJ72 hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjx34ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 10:50:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E734710002A;
 Thu, 30 Apr 2020 10:50:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B75992AE6AF;
 Thu, 30 Apr 2020 10:50:36 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 30 Apr
 2020 10:50:36 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 30 Apr 2020 10:50:36 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH v2 5/5] doc: add bind/unbind command documentation
Thread-Index: AQHWHiCXcT4sNnbdTU+Ai4siZm7OTqiQQ32AgAD3joA=
Date: Thu, 30 Apr 2020 08:50:36 +0000
Message-ID: <bf164d82-b6ba-b0ec-afd0-6b35f10252bf@st.com>
References: <20200429122031.31279-1-patrice.chotard@st.com>
 <20200429122031.31279-6-patrice.chotard@st.com>
 <CAPnjgZ3sioJvPoz0BPZ1tQzhNvzdusiHmDP8v=fxmpH25Q2mXw@mail.gmail.com>
In-Reply-To: <CAPnjgZ3sioJvPoz0BPZ1tQzhNvzdusiHmDP8v=fxmpH25Q2mXw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <A6320C19E1BE82459786383A3EC40F71@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_03:2020-04-30,
 2020-04-30 signatures=0
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Andre Przywara <andre.przywara@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/5] doc: add bind/unbind command
	documentation
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


On 4/29/20 8:04 PM, Simon Glass wrote:
> Hi Patrice,
>
> On Wed, 29 Apr 2020 at 06:20, Patrice Chotard <patrice.chotard@st.com> wrote:
>> Add documentation in doc/drivel-model for the bind/unbind command.
>> Part of this documentation is extracted from original patch commit
>> message:
>> commit 49c752c93a78 ("cmd: Add bind/unbind commands to bind a device to a driver from the command line")
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> ---
>>
>> Changes in v2: None
>>
>>  doc/driver-model/bind.rst  | 32 ++++++++++++++++++++++++++++++++
>>  doc/driver-model/index.rst |  1 +
>>  2 files changed, 33 insertions(+)
>>  create mode 100644 doc/driver-model/bind.rst
>>
>> diff --git a/doc/driver-model/bind.rst b/doc/driver-model/bind.rst
>> new file mode 100644
>> index 0000000000..df6b5f143b
>> --- /dev/null
>> +++ b/doc/driver-model/bind.rst
>> @@ -0,0 +1,32 @@
>> +.. SPDX-License-Identifier: GPL-2.0+
>> +.. sectionauthor:: Patrice Chotard <patrice.chotard@st.com>
>> +
>> +Binding/unbiding a driver
> unbinding
>
>> +=========================
>> +
>> +This documents aims to describe the bind and unbind commands.
> document
>
>> +
>> +For debug purpose, it should be useful to bind or unbind a driver from
> For debugging
>
>> +the U-boot command line.
>> +
>> +The unbind command calls the remove device driver callback and unbind the
>> +device from its driver.
>> +
>> +The bind command binds a device to its driver.
>> +
>> +In some cases it can be useful to be able to bind a device to a driver from
>> +the command line.
>> +The obvious example is for versatile devices such as USB gadget.
>> +Another use case is when the devices are not yet ready at startup and
>> +require some setup before the drivers are bound (ex: FPGA which bitsream is
>> +fetched from a mass storage or ethernet)
>> +
>> +usage example:
>> +
>> +bind usb_dev_generic 0 usb_ether
>> +unbind usb_dev_generic 0 usb_ether
> can you mention what the two parameters are and how to find them?

I will fix typos and update the documentation with these informations.

Thanks

Patrice

>
>> +or
>> +unbind eth 1
>> +
>> +bind /ocp/omap_dwc3@48380000/usb@48390000 usb_ether
>> +unbind /ocp/omap_dwc3@48380000/usb@48390000
>> diff --git a/doc/driver-model/index.rst b/doc/driver-model/index.rst
>> index b9df221627..37ef3721df 100644
>> --- a/doc/driver-model/index.rst
>> +++ b/doc/driver-model/index.rst
>> @@ -6,6 +6,7 @@ Driver Model
>>  .. toctree::
>>     :maxdepth: 2
>>
>> +   bind
>>     debugging
>>     design
>>     ethernet
>> --
>> 2.17.1
>>
> Regards,
> Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
