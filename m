Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DBD9A16E9
	for <lists+uboot-stm32@lfdr.de>; Thu, 17 Oct 2024 02:24:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D8B9C78032;
	Thu, 17 Oct 2024 00:24:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BBD4C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 00:24:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EDE4388E21;
 Thu, 17 Oct 2024 02:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729124685;
 bh=zy6Xe+Tosn7fu0i2WWjUUi/eF4/VMc7tUjlp+YHzLkc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bK58j7Tvfnn1aL2ZdZVaofTcvL5IHdvQomISRgC9nwlcA9p766WybkiTVqOS9Iseh
 mm7yfyXbur3wid1yVdH6SoNSh123vkNudxs0VFoZH37NdxYfTvGVWJvI0f7AY0lRNT
 WFOUHscUL5LTd8QFGH7iPFhLGr2BOvOGlokHg7TAGMZCExxK8783wcIsee505soH+s
 DcNBsyfgyIm7i9J9SOsNtCdd39hoKZESiB5aMfnBYt20W/hkZqCbrdp4AKOs+alesV
 1GunzwP7NzucBEzE8dkJuD0f22IKnbe1WHzNIvuTmiZ5sBLGFKxf0TD/RPNzjgEahj
 VRasyLL6LgkRg==
Message-ID: <26054b3d-c86c-458d-ba23-11f49843787a@denx.de>
Date: Thu, 17 Oct 2024 02:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20240930192343.59359-1-marex@denx.de>
 <dc0a0638-0724-46d1-99c7-ee8b84e5541b@foss.st.com>
 <92a9153c-c948-43bb-8542-163ec245c74d@denx.de>
 <81cabd9f-2c4b-4b1f-a15b-0830b75a3df8@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <81cabd9f-2c4b-4b1f-a15b-0830b75a3df8@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add script to install U-Boot
 from SD/eMMC to SPI NOR on DH STM32MP15xx DHSOM
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

On 10/16/24 7:59 PM, Patrick DELAUNAY wrote:

Hello Patrick,

>>> b) you are using "sf" command and not "mtd" to udpate SPI NOR ?
>>>
>>>
>>> the MTD command allows to use the MTD partition name, defined in DT,
>>> so no need to know offset in script (and avoid "sf probe")
>>>
>>> mtd erase fsbl1; mtd write fsbl1 ${loadaddr1} 0 ${filesize1} \
>>> mtd erase fsbl2; mtd write fsbl2 ${loadaddr1} 0 ${filesize1} \
>>> mtd erase uboot; mtd write uboot ${loadaddr} 0 ${filesize}
>> Can you also do 'sf update' alike operation with 'mtd' command? I 
>> don't think you can. The 'sf update' often does significantly speed up 
>> the SPI NOR update process, because SPI NOR erase operation is very 
>> slow, while SPI NOR read operation is fast, so if the update can read 
>> and then skip many blocks which are already in the SPI NOR and erase 
>> and write only the changed blocks, the update is often very fast too.
> 
> 
> Good point....
> 
> an improve place for MTD command
> 
> I will try to propose something for mtd command
> 
> 
> and for the patch
> 
> 
> Applied to u-boot-stm/master, thanks!
btw look at doc/README.dfutftp , I use that to update R-Car boards which 
also require multiple blobs at various offsets in HyperFlash (HF behaves 
like a regular Parallel NOR). I can generate a fitImage which contains 
the blobs and their offsets and then run dfu tftp to download the 
fitImage from TFTP server and install the blobs automatically.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
