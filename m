Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630A1BF43F
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 11:37:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4885FC36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 09:37:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6E37C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 09:37:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U9SX4q031496; Thu, 30 Apr 2020 11:37:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ZSb44VQfwYontZebeXHukf5bmWJ1tLyTGbQH/VYaY9c=;
 b=BlmX6hvq6PONorgpAxXRcS42r/us7etjnbpM3JH1CVDqxjjUfWMiiVJWZZneisjR6hbr
 qh6rs7yAW5gp0Ca0iLDz+CJDdzotikynGCRpR09zLyGbdO38Paj/rSAeAyaRZtF4H7UR
 0leyXfH5Aee11iknOypgv5ORJd6/vUWJXbRqcpEKOgzupxYjhQfPxRCgCXHNTqjPOx2k
 IBF7thKaengUxi4Yb3HjoT5dllvibHz1jXESpcWIY4MUwSPT9nMKe308IqocimnhJHM2
 FnwxKrk+8/1jWXGqbfrJgQ6PDQ+WPwZD4SyKbHT5KbsdIFuIyNDci57p4Bm/0Zmkh+FR Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30qst08xdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 11:37:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB18210003A;
 Thu, 30 Apr 2020 11:37:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C81AD2B2B5B;
 Thu, 30 Apr 2020 11:37:16 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 11:37:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 30 Apr 2020 11:37:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v3 5/5] doc: add bind/unbind command documentation
Thread-Index: AQHWHsyxPuK9Jc7W0ESeW7nKwm6mDaiRRUSAgAABeIA=
Date: Thu, 30 Apr 2020 09:37:16 +0000
Message-ID: <b432960f-d587-70a2-dc0f-a89789500145@st.com>
References: <20200430085226.19349-1-patrice.chotard@st.com>
 <20200430085226.19349-6-patrice.chotard@st.com>
 <286308d8-8229-f2ec-8ab5-e0ac33786022@gmx.de>
In-Reply-To: <286308d8-8229-f2ec-8ab5-e0ac33786022@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <A5A1D1FE216925488A1F41772579908B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_05:2020-04-30,
 2020-04-30 signatures=0
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 5/5] doc: add bind/unbind command
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

Hi Heinrich

On 4/30/20 11:31 AM, Heinrich Schuchardt wrote:
> On 30.04.20 10:52, Patrice Chotard wrote:
>> Add documentation in doc/drivel-model for the bind/unbind command.
>> Part of this documentation is extracted from original patch commit
>> message:
>> commit 49c752c93a78 ("cmd: Add bind/unbind commands to bind a device to a driver from the command line")
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> ---
>>
>> Changes in v3:
>>  - fix typo
>>  - add bind/unbind parameters description and how to find them
>>
>> Changes in v2: None
>>
>>  doc/driver-model/bind.rst  | 49 ++++++++++++++++++++++++++++++++++++++
>>  doc/driver-model/index.rst |  1 +
>>  2 files changed, 50 insertions(+)
>>  create mode 100644 doc/driver-model/bind.rst
>>
>> diff --git a/doc/driver-model/bind.rst b/doc/driver-model/bind.rst
>> new file mode 100644
>> index 0000000000..dfe8fd57dd
>> --- /dev/null
>> +++ b/doc/driver-model/bind.rst
>> @@ -0,0 +1,49 @@
>> +.. SPDX-License-Identifier: GPL-2.0+
>> +.. sectionauthor:: Patrice Chotard <patrice.chotard@st.com>
>> +
>> +Binding/unbinding a driver
>> +=========================
> The title underline is too short.
>
> Please, use 'make htmldocs' for testing.

Thanks for the tips

Patrice


>
> Best regards
>
> Heinrich
>
>> +
>> +This document aims to describe the bind and unbind commands.
>> +
>> +For debugging purpose, it should be useful to bind or unbind a driver from
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
>> +usage:
>> +
>> +bind <node path> <driver>
>> +bind <class> <index> <driver>
>> +
>> +unbind <node path>
>> +unbind <class> <index>
>> +unbind <class> <index> <driver>
>> +
>> +Where:
>> + - <node path> is the node's device tree path
>> + - <class> is one of the class available in the list given by the "dm uclass"
>> +   command or first column of "dm tree" command.
>> + - <index> is the index of the parent's node (second column of "dm tree" output).
>> + - <driver> is the driver name to bind given by the "dm drivers" command or the by
>> +   the fourth column of "dm tree" output.
>> +
>> +example:
>> +
>> +bind usb_dev_generic 0 usb_ether
>> +unbind usb_dev_generic 0 usb_ether
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
>>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
