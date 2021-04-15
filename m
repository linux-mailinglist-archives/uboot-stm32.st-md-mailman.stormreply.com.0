Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E33736105E
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Apr 2021 18:46:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4B69C57B78;
	Thu, 15 Apr 2021 16:46:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E97B6C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 16:46:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FGeomP010616; Thu, 15 Apr 2021 18:45:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hJrJucq3tQrlcw7e38tzeRNqy+kzvFJzo8jWJeodf2w=;
 b=VVW58ucSat9FTk3u2Bv8Jw9kW2xNj+i1m1D46pex6Ep+1AWGIi4Cv6wG6ZJlXsT5+DgV
 AIBMAwi6UqKkHxK2H0Y2RB2MP61hMtAQ6cGGmPbaxdserN5/sQjEdcmhT4IrINnTtt8Z
 eA4R3I7qBlp7lZWfUK/C1gz8TbCi8e6+E4DR2OI+XncUnFD6fwQmD4n2ioOr4G9xnKrv
 MCCnK+65K1nyXm9tQHBFwvsX/HnAbwQmayJiJWlPorsr0nWJsPTG8xPY/lwZHnCpmtz9
 D9gDGQQxG4OE/owQvHneoSY8sC+vKoMhOnHv9KtjFa1fx70lmGn1cSDhJaO29JRt6icf mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xes0vcy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 18:45:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 323DD10002A;
 Thu, 15 Apr 2021 18:45:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1013C2BA2C4;
 Thu, 15 Apr 2021 18:45:50 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Apr
 2021 18:45:49 +0200
To: Ramon Fried <rfried.dev@gmail.com>, Marek Vasut <marex@denx.de>
References: <20210409100022.1.I93dea8b89ea632e7d8f2640a6eca6f6e69fed319@changeid>
 <bf1fcbd0-b54e-b03f-1ac2-27475ee747e2@denx.de>
 <68133a1e-5440-0a5d-d5a4-2c1d85ef0c1b@foss.st.com>
 <5deab9a1-3326-5115-71e2-569aa4077ab6@denx.de>
 <CAGi-RU+QZRQ8EVPfX7XZET2LodgrU5mkYG+scWNzow9aLFPFEA@mail.gmail.com>
 <CAGi-RU+5mak+v3OZ4Yuuv7-2tMdoj4BHy3g4kbEf2ij9pNszoQ@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <07bbb791-1170-3e50-9678-018a4c45b542@foss.st.com>
Date: Thu, 15 Apr 2021 18:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGi-RU+5mak+v3OZ4Yuuv7-2tMdoj4BHy3g4kbEf2ij9pNszoQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_06:2021-04-15,
 2021-04-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Stephen Warren <swarren@nvidia.com>,
 Christophe Roullier <christophe.roullier@st.com>, Joe
 Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of device
 tree configuration for reset delay
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

Hi,

On 4/15/21 8:08 AM, Ramon Fried wrote:
> On Thu, Apr 15, 2021 at 4:41 AM Ramon Fried <rfried.dev@gmail.com> wrote:
>> On Wed, Apr 14, 2021 at 5:36 PM Marek Vasut <marex@denx.de> wrote:
>>> On 4/14/21 4:07 PM, Patrick DELAUNAY wrote:
>>>> Hi,
>>> Hi,
>>>
>>>> On 4/9/21 2:22 PM, Marek Vasut wrote:
>>>>> On 4/9/21 10:00 AM, Patrick Delaunay wrote:
>>>>>> The gpio reset assert/deassert delay are today harcoded in U-Boot driver
>>>>>> but the value should be read from DT.
>>>>>>
>>>>>> STM32 use the generic binding defined in linux:
>>>>>> Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>>>>>
>>>>>>     reset-gpios:
>>>>>>       maxItems: 1
>>>>>>       description:
>>>>>>         The GPIO phandle and specifier for the PHY reset signal.
>>>>>>
>>>>>>     reset-assert-us:
>>>>>>       description:
>>>>>>         Delay after the reset was asserted in microseconds. If this
>>>>>>         property is missing the delay will be skipped.
>>>>>>
>>>>>>     reset-deassert-us:
>>>>>>       description:
>>>>>>         Delay after the reset was deasserted in microseconds. If
>>>>>>         this property is missing the delay will be skipped.
>>>>>>
>>>>>> See also U-Boot: doc/device-tree-bindings/net/phy.txt
>>>>> Since this is a PHY property, shouldn't that be handled in
>>>>> drivers/net/phy/ instead of MAC driver ?
>>>>
>>>> I was my first idea but I don't found found the correct location in phy
>>>> (driver or uclass)
>>>>
>>>> to manage these generic property and the generic property "reset-gpios"
>>>> was already
>>>>
>>>> managed in eth driver, so I continue to patch the driver.
>>>>
>>>>
>>>> But I come back to this idea after your remark....
>>>>
>>>> => in linux these property are managed in
>>>>
>>>>       drivers/net/mdio/of_mdio.c::of_mdiobus_phy_device_register
>>>>
>>>>           parse DT node and add info in mdio
>>>>
>>>>       drivers/net/phy/mdio_device.c::mdio_device_reset
>>>>
>>>>           called in  mdio_probe / mdio_remove
>>>>
>>>>
>>>> In my first search, I don't found the same level in the U-Boot drivers
>>>> in drivers/net/phy/
>>> Note that this is MDIO-wide PHY reset (e.g. you can have single reset
>>> line connected to multiple PHYs on single MDIO bus), this is not
>>> PHY-specific reset.
>>>
>>>> but I miss the uclass defined in drivers/net/eth-phy-uclass.c
>>>>
>>>>
>>>> Finally I think I need to manage the generic binding property
>>>>
>>>> (reset-gpios, reset-assert-us, reset-deassert-us) directly  in
>>>>
>>>> => drivers/net/mdio-uclass
>>>>
>>>>
>>>> The GPIO RESET will be managed in mdio  ops: pre_probe/ post_remove
>>>>
>>>> as it is done in linux
>>>>
>>>> warning: today post_remove ops don't exit in u-class.
>>>>
>>>>
>>>> Do you think it is the correct location ?
>>> For single-PHY reset, the correct location is in drivers/net/phy/ somewhere.
>>>
>>>> Do you think it should be a new serie (migrate the eqos property in mdio)
>>>>
>>>> after this eqos is accepted
>>>>
>>>> or I shoudl sent a new serie to replace this serie.
>>> I'll leave that decision to Ramon/Joe.
>> Joe, I'll leave this to you.
> You know what, let's go with the new series, please migrate it to the net/phy.
> Thanks,
> Ramon


I am preparing V2 with DT parsing in drivers/net/eth-phy-uclass.c

with CONFIG_DM_ETH_PHY enabled for stm32 variant of dwc_eth_qos driver.

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
