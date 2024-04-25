Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A40578B1AD2
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Apr 2024 08:19:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A555C7128B;
	Thu, 25 Apr 2024 06:19:45 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AAC6C6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 06:19:44 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-572229f196bso622429a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 23:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714025984; x=1714630784;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9ut19bRwG2fmkujRzCgC3FHO+3xt++a07yprq43roIQ=;
 b=Ql7fn12JUJYS1TUrA2aSiBgcP/95AHdm+A2TfN6EJ13yy5ySrILsAj6CRorjVwwlzW
 ltqm0rJGyunSPz8eGs737TAIwz2ZD/OT4Sk0g11VXA2tHGlcQgL1uxDEPZXn4iaOZdK9
 bQDGkpX+CedynFkbOa2sR6RXRz/yfwiB1wLTygR1DKqEdvix29RIgQfPxiynLZyA1Xtm
 oUc4MgsVkPyI8QrXV7hRN6Glim18k8uV1m7Yn8n/bPIfWdrYVlmvNOg6jl9LlDnmP/LQ
 ILLuaXRCZuIGNxbRkutlwVtp3SUF/kqxbDxEarJUEkk8HfZi0lgt7cuEuOYBiQ4l58Dh
 S5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714025984; x=1714630784;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ut19bRwG2fmkujRzCgC3FHO+3xt++a07yprq43roIQ=;
 b=c4h8/73ozYjKFBAI5XDFBnJEEaIeR9djKvkL7bRTgAHgs3sk5CYmqb4XY0/wAsH/aO
 0aQc4uZ5NiVCRoWlRrRtHqRZjCeh1YOkr/TnfTeW1D9m7H/Zwd7s7/1pEReaqQcu5iJx
 97rg1iPKzSee/+RuVykNtjv/qjS8z0mO2wnaCL8IvtvvsPl1W9Vjp1vyY8bl/bYzYMf4
 vZxuB/i5oL4xKzCdNTEQmU/2dOLv7PY300JBQf4YiFEG2IhF6vNfshANq8/Ydi87bVkY
 PDJlN6jRxW4HoxiT6q57BKU7+M+81fS0hGZn5yNwQUIMJWW40y9vF2Km8+LpklJBwzEI
 qBBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRIKLH6ukurLMQ6/pBPXDPfCi17DZv8hEo5dy67tYn1fNGbEKdQDrR2D3xxvZ4y64iplNxvet8nTNXhRXGiJDolvbrJI8yZNyrM+b8e+eNMvIhUcTOOmVM
X-Gm-Message-State: AOJu0YxRjoOR7lyiNG7UzUyq2V9vMxVhdw5FVYijkybMta57lTcFptTm
 dFbVjAIKKngSNDu3bSAZV4+bBydJvKqbAhn4wzXtCDv9TzzlTCL9oLbH228XNhQgosgtVI6O3Aq
 iCYtYgflx/h82tu0+tIj83sLdZEPGdWSbQ8ikdA==
X-Google-Smtp-Source: AGHT+IEYT4AocLYEhnXanfp+eQCj5ToVzkbHiGIH5Z0Cl1dTrnO61GjkT0qETOVZ7cFvvPC0HjlmJiy0pbDP5YZIumk=
X-Received: by 2002:a17:907:9689:b0:a52:3adb:e407 with SMTP id
 hd9-20020a170907968900b00a523adbe407mr3797677ejc.37.1714025983891; Wed, 24
 Apr 2024 23:19:43 -0700 (PDT)
MIME-Version: 1.0
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 25 Apr 2024 09:19:07 +0300
Message-ID: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
To: U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, 
 Richard Hughes <hughsient@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michael Walle <michael@walle.cc>, FUKAUMI Naoki <naoki@radxa.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Paul Liu <paul.liu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 chris.obbard@collabora.com, Heiko Thiery <heiko.thiery@gmail.com>
Subject: [Uboot-stm32] Capsule GUIDs and LVFS
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

Hi,

Richard maintains LVFS & fwupd, commonly used for firmware upgrades.
We recently discussed the U-Boot status and supported devices since
fwupd supports capsule updates.
In order to be able to support capsule updates via LVFS manufacturers
should bind their GUIDs to their devices. Any ODM/OEM creating a board
based on the original device must use his own
GUIID to avoid confusion. If not we would end up with different
devices reusing the same GUIDs and upgrading their firmware with a
different one.

Looking at the defined GUIDS for capsule updates defined in board
support files I found the following

Richard, the following GUIDs should at least issue a warning in LVFS
since they only work for QEMU & Sandbox internally.
Sandbox SANDBOX_UBOOT_IMAGE_GUID 09d7cf52-0720-4710-91d1-08469b7fe9c8
Sandbox SANDBOX_UBOOT_ENV_IMAGE 5a7021f5-fef2-48b4-aaba-832e777418c0
Sandbox SANDBOX_FIT_IMAGE_GUID 3673b45d-6a7c-46f3-9e60-adabb03f7937
QEMU QEMU_ARM_UBOOT_IMAGE_GUID f885b085-99f8-45af-847d-d514107a4a2c
QEMU QEMU_ARM64_UBOOT_IMAGE 058b7d83-50d5-4c47-a195-60d86ad341c4

I've cc'ed all the people I could find in board specific MAINTAINER files.
Can you respond to Richard with the proper company name & board name
so we can bind the following GUIDs to a vendor properly?
Richard any guidance on how this should be done properly is
appreciated, since I am not too aware of LVFS internals.

Advantech IMX8MP_RSB3720A1 b1251e89-384a-4635-a806-3aa0b0e9f965
Advantech IMX8MP_RSB3720A1_6G b5fb6f08-e142-4db1-97ea-5fd36b9be5b9

Compulab IMX8MM_CL_IOT_GATE 7a32a939-ab92-467b-9152-74771b95e646
Compulab MX8MM_CL_IOT_GATE_OPTEE_FIT 0bf1165c-1831-4864-945e-ac3d3848f499

Kontron KONTRON_PITX_IMX8M_FIT_IMAGE_GUID c898e959-5b1f-4e6d-88e0-40d45cca1399
Kontron KONTRON_SL_MX8MM_FIT_IMAGE_GUID d488e45a-4929-4b55-8c14-86cea2cd6629
Kontron KONTRON_SL28_FIT_IMAGE_GUID 86ebd44f-feb8-466f-8bb8-890618456d8b

Radxa ROCKPI_4B_IDBLOADER_IMAGE_GUID 02f4d760-cfd5-43bd-8e2d-a42acb33c660
Radxa ROCKPI_4B_UBOOT_IMAGE_GUID 4ce292da-1dd8-428d-a1c2-77743ef8b96e
Radxa ROCKPI_4C_IDBLOADER_IMAGE_GUID fd68510c-12d3-4f0a-b8d3-d879e1d3a540
Radxa ROCKPI_4C_UBOOT_IMAGE_GUID b81fb4ae-e4f3-471b-99b4-0b3da549ce13

Socionext DEVELOPERBOX_FIP_IMAGE_GUID 7d6dc310-52ca-43b8-b7b9-f9d6c501d108
Socionext DEVELOPERBOX_FIP_IMAGE_GUID2 880866e9-84ba-4793-a908-33e0b916f398

STMicroelectronics STM32MP_FIP_IMAGE_GUID 19d5df83-11b0-457b-be2c-7559c13142a5
This seems to use the same GUID for multiple device variants. This
needs to be fixed

AMD/Xilinx XILINX_BOOT_IMAGE_GUID 20c5fba5-0171-457f-b9cd-f5129cd07228
AMD/Xilinx XILINX_UBOOT_IMAGE_GUID cf9ecfd4-938b-41c5-8551-1f883ab7dc18
ditto

Regards
/Ilias
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
