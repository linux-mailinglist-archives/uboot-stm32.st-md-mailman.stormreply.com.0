Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A568730F98
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Jun 2023 08:44:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C81FDC6A610;
	Thu, 15 Jun 2023 06:44:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A87BC6A60E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 06:44:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 84D8F861F3;
 Thu, 15 Jun 2023 08:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686811475;
 bh=Ip5PLUi0YldqLMFPjSWYg+XaywVhzC+xqFc2EmZt4ZE=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=JsxG3hH6XmomxP73/eoOm9ZApBqMqv2pAzeM0U5L7B6DbD2dWvJZBv1hBH7vuZpLe
 UX4HrT9wt4q0S62b+gJcKb3eRMz4PboOVupzFtKeS4piq0tBKJyR5XvKmirCYN8+S5
 DOeSksRlfmqIOOSbB2ZoJ2AhUVi7db+IMtmlQm4+PbCp2zgsqNufzQpHialDCpHaKE
 m70hzJySSEwWUkT0Z9eIZTzNIOHdXwoPkSprJEiGH1RshHhU8Nc42ANhoGm+j/fDRa
 9FTWk27Nd0MfHd2cb/0xCCfyAQ5dVZHFouq1T4QAoNzxuAlw26E1f0nfsPzzjDdY1C
 Rxcv9zcSuUYUA==
Message-ID: <cb59086b-3212-3b46-990f-c8223a6122a4@denx.de>
Date: Thu, 15 Jun 2023 08:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20230517220239.329807-1-marex@denx.de>
 <e171b09d-0e7d-1815-6133-0946212a08d9@foss.st.com>
 <607a112c-4320-5a5f-b988-98e5ea8e3267@denx.de>
In-Reply-To: <607a112c-4320-5a5f-b988-98e5ea8e3267@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Power cycle Buck3 in reset on
	DHSOM
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

On 5/29/23 03:57, Marek Vasut wrote:

Hello again,

[...]

>> So the backup domain is loosed on ST board with STPMIC1 only when the 
>> power
>>
>> is removed and not for reset or for power off.
> 
> Thank you for the clarification.
> 
> I should check suspend/resume on EV1 soon ...

We do have this problem on EV1 too I'm afraid:

# U-Boot 2f4664f5c3e ("Merge branch '2023-06-14-assorted-fixes'")
$ git clean -fqdx ; make stm32mp15_basic_defconfig && make -j$(nproc)
$ dd if=u-boot-spl.stm32 of=/dev/sdX1 && dd if=u-boot-spl.stm32 
of=/dev/sdX2 && dd if=u-boot.img of=/dev/sdX3

# Linux next 925294c9aa184 ("Add linux-next specific files for 20230615")

U-Boot SPL 2023.07-rc4-00008-g2f4664f5c3e (Jun 15 2023 - 08:36:52 +0200)
RAM: DDR3-DDR3L 32bits 533000kHz
WDT:   Started watchdog@5a002000 with servicing every 1000ms (32s timeout)
image entry point: 0xc0100000


U-Boot 2023.07-rc4-00008-g2f4664f5c3e (Jun 15 2023 - 08:36:52 +0200)

CPU: STM32MP157FAA Rev.Z
Model: STMicroelectronics STM32MP157C eval daughter on eval mother
Board: stm32mp1 in basic mode (st,stm32mp157c-ev1)
Board: MB1263 Var4.0 Rev.C-03
...
boot as usual into Linux with initramfs for simplicity sake
...
$ cat /proc/cmdline
console=ttySTM0,115200 no_console_suspend

# Suspend the system repeatedly (failure happens after 2-3 wake up cycles)
$ while true ; do rtcwake -s 100 -m mem ; done
wakeup from "mem" at Sat Jan  1 00:03:11 2000
[   39.316598] PM: suspend entry (deep)
[   39.318905] Filesystems sync: 0.000 seconds
[   39.324327] Freezing user space processes
[   39.328194] Freezing user space processes completed (elapsed 0.001 
seconds)
[   39.334006] OOM killer disabled.
[   39.337158] Freezing remaining freezable tasks
[   39.342777] Freezing remaining freezable tasks completed (elapsed 
0.001 seconds)
[   39.426015] Disabling non-boot CPUs ...
[   39.448635] Retrying again to check for CPU kill
[   39.451909] CPU1 killed.
U-Boot SPL 2023.07-rc4-00008-g2f4664f5c3e (Jun 15 2023 - 08:36:52 +0200)
RAM: DDR3-DDR3L 32bits 533000kHz
DDR invalid size : 0x4, expected 0x40000000
DRAM init failed: -22
### ERROR ### Please RESET the board ###

Press RESET button

U-Boot SPL 2023.07-rc4-00008-g2f4664f5c3e (Jun 15 2023 - 08:36:52 +0200)
RAM: DDR3-DDR3L 32bits 533000kHz
DDR invalid size : 0x4, expected 0x40000000
DRAM init failed: -22
### ERROR ### Please RESET the board ###

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
