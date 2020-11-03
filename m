Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB412A4A5E
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Nov 2020 16:53:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 985AAC36B25;
	Tue,  3 Nov 2020 15:53:21 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D55F2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 15:53:19 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id 9so18809445oir.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Nov 2020 07:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NH1jFfsiiUtBh1CQWN+qVq59PW2JzW5s1m5wC1vthPY=;
 b=XZFSTu4LLK7RpJgRICL6lwDY5oYKYUin2kSGVX5nl6pK+jpxuRXOHxXHOQZM6beC3g
 rMFKPidCl1T97zsfzZr7erTaNRlvpaYkHSsm77Wm8/FMpC+QOhRDXUfHBWiQakOiHkpO
 i0yGvLGwSjrTS14VSHUkSt76iIcUp8OTHeQeMTIUh/xYMkI0zh6nyoLm1RQ2Sggz+TRL
 02iaFe5Pa6nMthz3caClaoNvvzqG08kZ7i5BN6ABjB5Tv+HylY+rhJtvexbk+QdIBHqz
 7v/TCSd3srKDGh7ROFh158VaTrnbco3V+gNpNJnGAGhK04IpMYKv2OWkYldmjuL92wr9
 LOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NH1jFfsiiUtBh1CQWN+qVq59PW2JzW5s1m5wC1vthPY=;
 b=XcUJ5ufXVQ8trlqWL857mrXzYtqJ9LsjdQK5uV5/GJDs56sPsRuM26CxbV1jiDqf6E
 GMa4yV4leretMQrZDISfOYDg/PbBFOpsQd3/UDIPRikMKJ5Ku6YcrXWNPEF/b9MdaW/h
 D1EHzceHfkds6bhTradHMmP7bl3NPP3AbXjKUijd6nRwMI8tl7Efw1PNxrcrvkcnHm3j
 i8/Ie7ruEuJI1zU2KMC1vZtZ/2wl0w3o/QuxqLpzDFJT2VTL7pffeYFsN1WrgmVUi56Y
 Ey3H7eHQaWkjUQTIqXYiWIVL8ChB2LH9TpLL+bjiy1wDkqp7KTqWp+iZ5poKOQzYxT0b
 s/7Q==
X-Gm-Message-State: AOAM531y2JYL24EB5JAAUHuCOzG/NczqxWyf+NqkdoY0YPzl+QlUrfA2
 +xuMPHjuFVv9BIYvab7t7i8=
X-Google-Smtp-Source: ABdhPJx6TqqviDNyREp6eciIsEOzwZ2xMNU0S5hwR5NiJhkGIjnyz3xrjYNKU9lnQwPKxA/Mk00mBQ==
X-Received: by 2002:aca:356:: with SMTP id 83mr226756oid.66.1604418798400;
 Tue, 03 Nov 2020 07:53:18 -0800 (PST)
Received: from nuclearis2-1.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id h1sm907258oti.78.2020.11.03.07.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 07:53:17 -0800 (PST)
To: Etienne Carriere <etienne.carriere@linaro.org>
References: <fd5e7932-11b9-3a06-0169-ddf13e91ffee@gmail.com>
 <bdf285bd-7540-b7cf-989f-0f24594c6940@gmail.com>
 <CAN5uoS-EoT7aUC1OEmeLv46SUzRFHe_nnr6T8Pvq+9VWc6RV8w@mail.gmail.com>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <edb08339-a0f0-f9d6-bd5e-d5f1fa7b52c1@gmail.com>
Date: Tue, 3 Nov 2020 09:53:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAN5uoS-EoT7aUC1OEmeLv46SUzRFHe_nnr6T8Pvq+9VWc6RV8w@mail.gmail.com>
Content-Language: en-US
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] stm32mp: The purpose of "!tee_find_device()"
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

On 10/30/20 3:28 AM, Etienne Carriere wrote:
> On Thu, 29 Oct 2020 at 15:33, Alex G. <mr.nuke.me@gmail.com> wrote:
>>
>> On 9/30/20 6:03 PM, Alex G. wrote:
>>> Hi
>>>
>>> I'm trying to wrap my head around the purpose of the following lines in
>>> ft_system_setup():
>>>
>>>       if (!CONFIG_IS_ENABLED(OPTEE) ||
>>>           !tee_find_device(NULL, NULL, NULL, NULL))
>>>           stm32_fdt_disable_optee(blob);
>>
>> Hi! Me again! Do we have a (good) reason for this, or should I submit a
>> patch to remove this problematic code?
>>
>> Alex
>>
>>> My interpretation is "if optee is not running, delete the FDT node".
>>> The problem is that tee_find_device() invokes device_probe(). This in
>>> turn does an SMC call. This call results in an abort and reboot if optee
>>> is not running in the first place.
>>>
>>> So I don't think that tee_find_device() can be used as a check for "Is
>>> optee running?". Exhibit B: Outside of mach-stm32mp, tee_find_device()
>>> is used to obtain of a _working_ TEE node, not to ask if "is optee
>>> running?".
>>>
>>>
>>> My problem is that trying to start linux with CONFIG_OPTEE=y will cause
>>> the bootm command to crash (log in appendix A):
>>>
>>>       
>>>       load mmc 0:7 $fdt_addr_r boot/stm32mp157c-dk2.dtb
>>>       load mmc 0:7 0xc8000000 boot/utee
>>>       setenv bootm_boot_mode sec
>>>       bootm 0xc8000000 - $fdt_addr_r
>>>
>>> What is the intent of calling tee_find_device() in an FDT fixup
>>> function?
> 
> The scheme is the generic U-Boot implementation do copy OP-TEE
> related nodes when found in its FDT to the FDT provided to Linux.
> (called from common/image-fdt.c)
> 
> However stm32mp1 can be used with or without OP-TEE installed. To
> get a generic stm32mp1/U-Boot image that support both configurations
> (with and w/o OP-TEE installed), U-Boot FDT and config for this plaform
> do enable OP-TEE but, at u-boot runtime, if we find OP-TEE's not present,
> we remove the FTD node so that Linux does get it and expect OP-TEE
> is present.
> 
>>> Do you have any ideas how to make it not crash (short of
>>> commenting out the problem lines) ?
> 
> The crash seems due to that there is no secure monitor by the time
> you have this sequence called. Secure monitor is the code that
> handles the SMC. If none installed, SMCs ends nowhere and
> likely badly crash the systel. If OP-TEE is not running but there
> is a secure monitor loaded, it should not crash.
> 
> It seems to me that U-Boot does set up a secure monitor for
> PSCI minimal support, so the U-Boot PSCI stack should
> nicely handle the SMC to report that there is no OP-TEE installed.
> Enabling CONFIG_ARMV7_PSCI should fix the issue I think.

Hi Etienne. I understand the reasoning behind this, and I agree that 
things shouldn't break in theory. However,I just double-checked this 
with master (7a8ac9df5d). I think we have a bug on our hands:

stm32mp15_basic_defconfig, with the following changes:

	CONFIG_TEE=y
	CONFIG_OPTEE=y
	CONFIG_OPTEE_TZDRAM_SIZE=0x01000000
	# CONFIG_SYSRESET_CMD_POWEROFF is not set

I double-checked that CONFIG_ARMV7_PSCI is indeed set. The following 
sequence will cause a bad mode abort:

	> load mmc 0:7 $loadaddr boot/uImage
	> load mmc 0:7 $fdt_addr_r boot/stm32mp157c-dk2.dtb
	> setenv bootargs console=ttySTM0 root=/dev/mmcblk0p7
	> bootm $loadaddr - $fdt_addr_r

Alex



> Regards,
> Etienne
> 
>>>
>>> Alex
>>>
>>>
>>> Appendix A: u-boot log after bootm command
>>>
>>> ## Booting kernel from Legacy Image at c8000000 ...
>>>      Image Name:
>>>      Created:      2020-09-28  20:58:56 UTC
>>>      Image Type:   ARM Trusted Execution Environment Kernel Image
>>> (uncompressed)
>>>      Data Size:    349276 Bytes = 341.1 KiB
>>>      Load Address: fdffffe4
>>>      Entry Point:  fe000000
>>>      Verifying Checksum ... OK
>>>      Loading Kernel Image
>>> ## Flattened Device Tree blob at c4000000
>>>      Booting using the fdt blob at 0xc4000000
>>>      Loading Device Tree to cffef000, end cffff5e2 ... OK
>>> <BOARD RESETS WITHOUT USER INPUT>
>>> U-Boot SPL 2020.10-rc4 (Sep 20 2020 - 23:46:47 +0000)
>>> Model: STMicroelectronics STM32MP157C-DK2 Discovery Board
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
