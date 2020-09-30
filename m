Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9F27F5A4
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Oct 2020 01:03:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0AAFC36B37;
	Wed, 30 Sep 2020 23:03:41 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E67E4C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 23:03:40 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id m13so3518926otl.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 16:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=l7bPXczaUKVEUzCbyWJRiqA8bud+79Zxtqjzt+C5XKk=;
 b=udbgXUS3Fzyi1srDRBKj8hdA/+wbZ92OsNifr3O2isQRUADmOt6LcwloN87I720MY7
 6MO9zhAjtc6jo8NfEihQJJwDEwxW2UwlwoeOSpaS/3JnLnV+YCx0QrIl3P1xdDEtjBT9
 9QWFcg204jDoPiEc75jmIwsSSKtr/oj5B6Y+n9sOjSd/tTG7zX0QxabOcBM8Mk+k1jVV
 I+ZT4LNyfuAMgUy1Qvoa12VU2rxJPjR4bd53MyzFH/Qo6AYefFasJoKGcqesigocF4ms
 cx0kGFg1NIHAfuQ/Fek4O8bYl7Xd1Prr1l7rtaV1EpuZSvHErl4nArKKkahBOH2znU5q
 Ie8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=l7bPXczaUKVEUzCbyWJRiqA8bud+79Zxtqjzt+C5XKk=;
 b=Qna6D/Zl3vpaiEzE+SRJKbiRgzkXDj24thV6a0n1vPO+428Q0jGag2IbYvpgulc0Uh
 rVod8oz+MSoEfUqiSWJw7WpHZdftZY3DtHJg3hnJyAhDpdpPPQGiXDsESK8HuDeH/h0G
 NyDK9LbWG2sfKy9HDkV8JgCLeUSZzQaXd/m7b1ducu8t9ERlA+IaUxh8FT6pFkrCh6R5
 8AgPR7FAiVTdLtwWL9zNT7MHaQG1af9b8x7A30JKbii5vqoJZnPzhc9Sn+bG9tNfDEbg
 YDa5ZUe0GP5xkBGtFS0nOAtNDYX/NHZ/1AZpHlOTZeXG1FuArXnpAI/Ajm9Jk8L3ZX6k
 QeUA==
X-Gm-Message-State: AOAM530NUW5o/OtO1KtD1ADs8yTRmD5kdnZh9imNC2Kt+hqd1rs94Oqe
 HN6Wb8f4O6rbYVl4GTPmCp4OweH+9jE=
X-Google-Smtp-Source: ABdhPJz5KIEDZJYG1BmPL5KjfMpcajUNQjNnUv4Y42e21maQQZK5zpsSh4gYC1UTlxL2r/DSPuCEbg==
X-Received: by 2002:a05:6830:1e8c:: with SMTP id
 n12mr3148846otr.17.1601507019590; 
 Wed, 30 Sep 2020 16:03:39 -0700 (PDT)
Received: from nuclearis2-1.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id h14sm780949otl.0.2020.09.30.16.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 16:03:39 -0700 (PDT)
From: "Alex G." <mr.nuke.me@gmail.com>
To: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Message-ID: <fd5e7932-11b9-3a06-0169-ddf13e91ffee@gmail.com>
Date: Wed, 30 Sep 2020 18:03:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] stm32mp: The purpose of "!tee_find_device()"
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

Hi

I'm trying to wrap my head around the purpose of the following lines in 
ft_system_setup():

	if (!CONFIG_IS_ENABLED(OPTEE) ||
	    !tee_find_device(NULL, NULL, NULL, NULL))
		stm32_fdt_disable_optee(blob);

My interpretation is "if optee is not running, delete the FDT node".
The problem is that tee_find_device() invokes device_probe(). This in 
turn does an SMC call. This call results in an abort and reboot if optee 
is not running in the first place.

So I don't think that tee_find_device() can be used as a check for "Is 
optee running?". Exhibit B: Outside of mach-stm32mp, tee_find_device() 
is used to obtain of a _working_ TEE node, not to ask if "is optee 
running?".


My problem is that trying to start linux with CONFIG_OPTEE=y will cause 
the bootm command to crash (log in appendix A):

	load mmc 0:7 $loadaddr boot/uImage
	load mmc 0:7 $fdt_addr_r boot/stm32mp157c-dk2.dtb
	load mmc 0:7 0xc8000000 boot/utee
	setenv bootm_boot_mode sec
	bootm 0xc8000000 - $fdt_addr_r

What is the intent of calling tee_find_device() in an FDT fixup 
function? Do you have any ideas how to make it not crash (short of 
commenting out the problem lines) ?

Alex


Appendix A: u-boot log after bootm command

## Booting kernel from Legacy Image at c8000000 ...
    Image Name:
    Created:      2020-09-28  20:58:56 UTC
    Image Type:   ARM Trusted Execution Environment Kernel Image 
(uncompressed)
    Data Size:    349276 Bytes = 341.1 KiB
    Load Address: fdffffe4
    Entry Point:  fe000000
    Verifying Checksum ... OK
    Loading Kernel Image
## Flattened Device Tree blob at c4000000
    Booting using the fdt blob at 0xc4000000
    Loading Device Tree to cffef000, end cffff5e2 ... OK
<BOARD RESETS WITHOUT USER INPUT>
U-Boot SPL 2020.10-rc4 (Sep 20 2020 - 23:46:47 +0000)
Model: STMicroelectronics STM32MP157C-DK2 Discovery Board
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
