Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0D2A25C8
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Nov 2020 09:03:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03CE9C36B35
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Nov 2020 08:03:37 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64AA1C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 16:35:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y12so3480377wrp.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/emH7jLI8sX7d1toR2j4XRU6HiSgcntm59Ck4V1WSjE=;
 b=gFEy8VJE/HtiYEb9MNEf8VDEGMjLpD1Z0pdMeqpurKsiRgOdz5foA7yaVpdFh6tCeR
 3xUBJs0hbnjwjl3m9jUzWCKpmUiTg0y05sKejtrCQm04ykdY3vYZCyePjwaT5IZeD5ik
 TPxZLbzDvQ67B+Q1IBN+iLuSuK57wM52qJAcwKeVyw9rIx/uRYBItZ4RIPHzIfLsuwYr
 JxLQW1FAm8Ef6gSwVEDuyz4heAeFXy7lEgqTRp7vGdah5j3iMjwhZscnYNedx6utlxZM
 eMQlYncMjkn/3DdgT4YzljcUkNTN74m+Nl+KFKW/Ila/J4GqaYM9EycQ+O+QXmseu8Zj
 XWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/emH7jLI8sX7d1toR2j4XRU6HiSgcntm59Ck4V1WSjE=;
 b=HHj3qYx6pCCb2TeleiqxFmw2PIvfntQ0gybYgHj+0vqmusnpLIqpsrgzMOUTcUlEO0
 CLF2r7rYxRANTn2Gd3E+m9ny2eY4sFjOLVRR3bIhq659DXGD0lU3Vf+/RnFKk2lVdXPb
 2rbORO+uVUUuWmRFo7zbK4h7MGtoWAge2WwMuSoG9yXpVYvm7fD4jjrXqHShR04CyfdC
 JR1km6tEu+F8aTfK7p1fb3W7IMJl2w74r1I9UrWG4+kYXCf+xtDJVz7dFWOcJOMxKkI5
 Sfq51a3gRu0ufoygDsF8bWb3WREQHVQ+f8DL0imHROzgBXVg4IrHT+ot2Dy4RGyrDrRs
 0FVQ==
X-Gm-Message-State: AOAM5329/YP/XUUERjHwkWGTTC0h2hH9XCr6pf1Z2uT7ZaYooZv2AS6A
 EsVfFNaANcgj6eB9eFExRKdDAA==
X-Google-Smtp-Source: ABdhPJy/UfhSHLoy3kJcJ+KnqNVVpIac74LdXZthl/cCUMH8DSwofnCI5Mu+XRH+fA2NrtCfjPoQqg==
X-Received: by 2002:adf:df91:: with SMTP id z17mr6418661wrl.379.1603989343760; 
 Thu, 29 Oct 2020 09:35:43 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:3cb:7bb0:3db4:67af:ee4:7a34?
 ([2a01:e0a:3cb:7bb0:3db4:67af:ee4:7a34])
 by smtp.gmail.com with ESMTPSA id v123sm646289wme.7.2020.10.29.09.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 09:35:43 -0700 (PDT)
To: Etienne Carriere <etienne.carriere@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <258ba4fa-8d1e-56be-e0de-2d6c09812c13@pengutronix.de>
 <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
 <f629253d8c92446ca1d33a25058c1676@SFHDAG2NODE3.st.com>
 <20201027172533.GD14816@bill-the-cat>
 <CAMj1kXGmW7bm10X9uQV1Aod=RrE30x_v5=1ACPSagoNyRjZ3Pw@mail.gmail.com>
 <976b2b1443424f659fa85a2d11b4b507@SFHDAG2NODE3.st.com>
 <CAN5uoS-ePc6u9Pbh6TR3MScPGZzOkAR5xSWQNnLjjmVrpW5zsg@mail.gmail.com>
 <CAMj1kXHiVrPs4g7AOCz7ja=q=vH921e-8x-XnZN25e0u=yme1Q@mail.gmail.com>
 <CAN5uoS-OEcfwMhLUvOYRoRSf1cpkdeBayS0yUC56_XPUxvHzrg@mail.gmail.com>
From: Jerome Forissier <jerome@forissier.org>
Message-ID: <54533fa8-0e11-56de-90c2-d05817de738d@forissier.org>
Date: Thu, 29 Oct 2020 17:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAN5uoS-OEcfwMhLUvOYRoRSf1cpkdeBayS0yUC56_XPUxvHzrg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 02 Nov 2020 08:03:34 +0000
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Joakim Bech <joakim.bech@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
 region with no-map property
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



On 10/29/20 5:06 PM, Etienne Carriere wrote:
> On Thu, 29 Oct 2020 at 12:26, Ard Biesheuvel <ardb@kernel.org> wrote:
>> The point I made before was that secure and non-secure are two
>> disjoint address spaces. The fact that TZ firewalls exist where you
>> can move things from one side to the other does not imply that things
>> works like this in the general case.
>>
>> E.g., you could have
>>
>> secure DRAM at S 0x0
>> non-secure DRAM at NS 0x0
>>
>> where the ranges are backed by *different* memory. Since the DT
>> description does not include the S/NS distinction, only the address
>> range, the only thing we can assume when looking at memory@ and
>> /reserved-memory is that everything it describes is NS.
> 
> From Arm Trustzone stand point, both secure and non-secure worlds
> share the very same physical address space. I your example, physical
> address 0x0 would refer to the same DRAM cell. Whether this cell is secure
> or non-secure is a configuration set in the DRAM firmwall.

No, like Ard said it is a possibility but it doesn't have to be the
case. See the Armv8-A ARM (DDI 0487F.c) section D5.1.3 VMSA address
types and address spaces, "Physical address (PA)".

If we need to differentiate between non-secure and secure PA I suppose
we could use the status and secure-status properties in the memory
nodes, consistent with the usual usage described in [1].

As Etienne says, it seems that a majority of systems actually have a
single PA space with access control added on top, and by default the
secure state can access non-secure memory. That goes well with memory
nodes without a status nor a secure-status property, yet other
configurations can easily be supported.

[1]
https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt

-- 
Jerome
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
