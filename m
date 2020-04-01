Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FE19AEA8
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 17:22:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA113C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 15:22:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09CD1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1585754528;
 bh=Atex2h4wgMfiFt62z5MN26pmqOnBxBLEiLAgZKbvKVk=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=MeeL/qRwiLzr4I+5nFXRrifjCuyrr9E2KffSqWg037XChFnA6kNti9SBXXJPCiTny
 HSgm6v8Xbs5AEN+mVAIVmoY/FHJjuXp8Qrnfju+DJIg9cLuWRDCuYQB7cnls2nBtc4
 oQB2A6ltiB7ya7shMbUW1eaMQF8Jxy5KkdsS3iW0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([84.119.33.226]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1in5X016xm-00c5dr; Wed, 01
 Apr 2020 17:22:08 +0200
To: Tom Rini <trini@konsulko.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Linus Walleij <linus.walleij@linaro.org>
References: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
 <20200401134713.GN27133@bill-the-cat>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Autocrypt: addr=xypron.glpk@gmx.de; prefer-encrypt=mutual; keydata=
 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 Eg==
Message-ID: <22a8dcd9-fb16-6b4e-992c-feada679b03b@gmx.de>
Date: Wed, 1 Apr 2020 17:21:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200401134713.GN27133@bill-the-cat>
Content-Language: en-US
X-Provags-ID: V03:K1:JS6gb262Ms36b5H7YdUz4Y5nnRhHW8aW3G3+lOSeZcGZHprt2s9
 bzcVpp7yPrZ2wSjKatOqv00tvweoEVxZJTztnlcuY9wvf/9xgB+nerxpX8ZoHeVKgeCvi8W
 yCO6SMqDj9KdIv+jYz5CRgQSbPniwMeG9iR2qfFQTERoRCWIuir8y5pOon3ak3jSRgpZb/h
 wkouuyxah6igpebSTF0fw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0OA8efheNnk=:i0akO9Ar9ECmbc/3xeHmiw
 KsHL5KpMe8O3FYxUzCTqNrbo7JpiAOadOGNI3tpa5N3MZ3rHbBqTBz/CaAfVGmowH7QowwCps
 LvYwYa/+0SIhY2qhrgXLlpR8sDOjSvBYr3gZG7AzbOz7DcsTcc0FPwKxtOpGUHnEkz1BQBARU
 utZONtpCo+jiVJmvMKRAZt4Q4syUnZmBNgeg3IsThfjOZCUX/fktHs1VQ9NfxYSyn3IG1ub+B
 aIbp1+AzLc9GOughBNLIoRTGQtu0zKsgd4AsrHGBoxXolM6HEGSP8GAsh4a7pW3L1JAR/uwqN
 AGE6Qo+xIj5OXjxVvfXtBv+1YGlDGlB8nW5OUlFpEtwRgXlkHWsqxgw6NJfkQChA4ndQg9p0U
 f0qbjAWaiy9TxXpfcksb9KDuNvFAVOzY32NWvqagJvVt2HZdctoPLyh/byVZK739PI3krq7zO
 a7RpCb/dIGJkIs1E0hRQGKSTan710t357gS+qNoyNMcUo+Vq2t81hmM1gGOOGFjFREaoEiIHZ
 ekmrIFBJ39D2ge4d+NO9AqBt740EfNf46XYNsYWzVMZpFUUs2P1pwHkUbhU17xMEQMi++gYEP
 mCwhYH3ThZVxoZd8BsyVECGDue0/3EydkkAjVFdfndXBQ2IYGgSI6HYJlczqBupz7eWNngxhi
 pv/jcFmVcQTjhZw7YhRcKHzGvFnvFqU7On/nHLKWgFQYmtlBxIisdLRzxwM5JGmlEH76TdhdI
 4vvshGqNwgwcKdjI4uGVXUnsGtAuf+N5MPdmKpjFR7yCGjwXfUL24yw4ZO703HCHZUQe7t+AF
 ad7vspOD9iMzFXWDL6i0VgQ1xD4AU68VxKA5ryuG91mz2F7YDf0NmNpudqSTUIG/UPk8pXofM
 qR7lBBfURwbVx0Oba/0NxRSoM1SRVOcRdF5gNKzNDX1OdPkWyoeM46NJpUkkiKV/+FUy5/gXY
 afUcNQBJYfIGK1FzWf1D7k4FYtyVIq06hYK3QfdtqPthFzk4aCN92F7aNNiwCmY+h2SuDHyL+
 hLwAzz3/0+DZcFmuPWYk03n5vjHL1UIkwXcDmrgreofYIsRPmyG8KauDQplPWBzoKwyTb2naJ
 mAmTwoMNrE3suoTzMQd/T5Nq0uMIC6I7NUWnlD8gKh1Imu0LWYj65j3v40hGz+7PtOaJ0iAjF
 xv6yZNtus66o+nIwukzNlnQelXl08RMEnre9f7CTOw/sv28suGxJDlmHezUljfjtbOXxbaxbD
 7iA1fKse+8yqzvnS1
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm/master
	=u-boot-stm32-20200401
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

On 4/1/20 3:47 PM, Tom Rini wrote:
> On Wed, Apr 01, 2020 at 12:43:44PM +0000, Patrick DELAUNAY wrote:
>> Hi Tom,
>>
>> Please pull the latest STM32 master bugfix for v2020.04 = u-boot-stm32-20200401
>>
>> With the following changes:
>> - Fix device tree of Avenger96 board from Arrow Electronics and add
>>   compatibility with stm32mp15_dhcom_basic_defconfig
>>
>> CI status: Failed for vexpress_ca9x4 test.py
>>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2592
>
> So, this failed because we tried, again, to run a test that we're
> supposed to be skipping.  I both want to know _why_ this keeps happening
> but also think we really need to update the vexpress config such that
> EFI tests are not skipped and we have the device tree available (via
> fdt_addr or fdtcontroladdr environment variable).  Thanks!
>
Hello Tom,

this repository contains Kristian Amlie's problematic vexpress_ca9x4
patch but has not been rebased upon current origin/master. This is why
the patch for skipping the test is missing.

We get all those warnings below. On the other hand I think the only
virtue of all the vexpress configurations is testing that our legacy
non-DM code is running.

===================== WARNING ======================
This board does not use CONFIG_DM. CONFIG_DM will be
compulsory starting with the v2020.01 release.
Failure to update may result in board removal.
See doc/driver-model/migration.rst for more info.
====================================================
===================== WARNING ======================
This board does not use CONFIG_DM_MMC. Please update
the board to use CONFIG_DM_MMC before the v2019.04 release.
Failure to update by the deadline may result in board removal.
See doc/driver-model/migration.rst for more info.
====================================================
===================== WARNING ======================
This board does not use CONFIG_DM_ETH (Driver Model
for Ethernet drivers). Please update the board to use
CONFIG_DM_ETH before the v2020.07 release. Failure to
update by the deadline may result in board removal.
See doc/driver-model/migration.rst for more info.
====================================================

Best regards

Heinrich
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
