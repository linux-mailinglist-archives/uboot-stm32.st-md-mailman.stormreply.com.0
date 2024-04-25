Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA918B2319
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Apr 2024 15:46:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E74CC71291;
	Thu, 25 Apr 2024 13:46:39 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75C57C6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 13:46:38 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a56d7d457a1so122498466b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714052798; x=1714657598;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C/A6qNgSji5q+GEjg+T43A+VL/sYq0yyp+rgFeCOs/U=;
 b=q/97Tw9ftZcmMT+gM9ylXm98uzteuC1jX3o6E5KhBFN7gQM0vlA5c186N2/Z0FYLv+
 Uz9rJ1DWfz3vVXWg+dnY21tj9njU0DSWb81GowEo25E4zS3QSQBRLnfI2AhXbPKmK9bH
 mD4SozesroM1kZrCllaJYbnH+Mj61yG+32RsJ4pETJ9LpgCdA5RDlHtqs4nIgZ+lJNTQ
 35k3C0iwnpVhKvbQhx6Pvip8UGGLgeHyLfMsdyKOKsrZHxsC1hDaacTNad8RRiz2kxB1
 3tPn46ToX/B555B6j/AnVgoUb4B3YDMiRTeZiufWAf3XbS6P7Jw+Ru52+xFIol+9Rd/4
 tLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714052798; x=1714657598;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C/A6qNgSji5q+GEjg+T43A+VL/sYq0yyp+rgFeCOs/U=;
 b=tL/Jl2QD7Uxx18tMjwUjwCsw7GDhaqJ5iMPOqyPrMxvhnKwXAT9ohpg41sGJaLlbty
 BHJ3/zgZN3dXcYZKDU5w17DG3H/67ipzgPJdTLzmoEFBhO1Nx2ta3BEwtu1cja7Zz7Yi
 Hrm6zVmpVLD0VCEt3df/sEWHGWVLs/LJHtPzQawhaGOL06DPD7cEIOxTDK4hDo2DmdC3
 ez7hiUxOw+8rRyHi4h8wL4Ksqqb3QbzhUkxDEj8+K9c0ZPt0Mr814pKXMXTXonN8pNgt
 B/+2UbwbFGGNoaWbo2TDTB84dluNAoNpH4QgV6oPXMSPT1AVSqeRqSMx0Nm8hSavbvai
 KFAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEIJA9EQW7iif6pFgQue5FuU7ciPUel+jfQh1IWujLNaVSQU93Cm9z5H0opvNifK6NkfmtGuJCGLsKdaLqKZtakoNKJeJR67TWsP7smcx6uOjDjIUnBT/O
X-Gm-Message-State: AOJu0YxwL2O+cpuuFpKMmbCTXKnBmhJqY+/tHF9jiFvzM9wTu4NRCwws
 ganlsRXgebnQtFofRA+qHKQJV7WQkmEJG1OnZuF4GpXVSRpCRHaAcCqD+wnbNYVSWv0Y6km0I4J
 kbEZC8e54T6jl3ovpO/ZUPyDgg02B+jUhzS0bKg==
X-Google-Smtp-Source: AGHT+IGoBIOPxqQNaYw9JZ5pv/xRTKOTzX7tVE7XugEbiZA7yrWh1n5uSfgRmKbuZt3SRInRm8GFczh00W7vaVrq0dk=
X-Received: by 2002:a17:906:f2d9:b0:a54:4f06:4d00 with SMTP id
 gz25-20020a170906f2d900b00a544f064d00mr3728097ejb.65.1714052797864; Thu, 25
 Apr 2024 06:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
 <CAD2FfiGuFaC=r+TGfq9auzWJbyzVNbug8zR9RzSwM2+Uk52d+Q@mail.gmail.com>
In-Reply-To: <CAD2FfiGuFaC=r+TGfq9auzWJbyzVNbug8zR9RzSwM2+Uk52d+Q@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 25 Apr 2024 16:46:01 +0300
Message-ID: <CAC_iWj+BonsVbA5Bw3Kck2k4b8SXru0U_Y2kAmx5=_t6SozotA@mail.gmail.com>
To: Richard Hughes <hughsient@gmail.com>
Cc: Tom Rini <trini@konsulko.com>, Jonas Karlman <jonas@kwiboo.se>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michael Walle <michael@walle.cc>,
 FUKAUMI Naoki <naoki@radxa.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Paul Liu <paul.liu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 chris.obbard@collabora.com, Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Uboot-stm32] Capsule GUIDs and LVFS
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

Hi Richard,

On Thu, 25 Apr 2024 at 15:28, Richard Hughes <hughsient@gmail.com> wrote:
>
> Hi all!
>
> > Any ODM/OEM creating a board
> > based on the original device must use his own
> > GUIID to avoid confusion. If not we would end up with different
> > devices reusing the same GUIDs and upgrading their firmware with a
> > different one.
>
> Yes and no. Of course it's never okay for vendor A to use the same
> GUID as vendor B -- but if vendor A has two models of hardware (for
> instance model C and model D) they can have the same capsule GUID if
> the update can use a DMI match on the product SMBIOS key to identify
> the system.

In theory, yes but we don't have any of these check in u-boot and I'd
rather avoid them and do it properly

> Of course, it's much better if they have different GUIDs
> in the ESRT to completely avoid the chance of the wrong firmware being
> flashed on the wrong device.

Exactly.

>
> > Richard, the following GUIDs should at least issue a warning in LVFS
> > since they only work for QEMU & Sandbox internally.
> > Sandbox SANDBOX_UBOOT_IMAGE_GUID 09d7cf52-0720-4710-91d1-08469b7fe9c8
> > Sandbox SANDBOX_UBOOT_ENV_IMAGE 5a7021f5-fef2-48b4-aaba-832e777418c0
> > Sandbox SANDBOX_FIT_IMAGE_GUID 3673b45d-6a7c-46f3-9e60-adabb03f7937
> > QEMU QEMU_ARM_UBOOT_IMAGE_GUID f885b085-99f8-45af-847d-d514107a4a2c
> > QEMU QEMU_ARM64_UBOOT_IMAGE 058b7d83-50d5-4c47-a195-60d86ad341c4
>
> Are these GUIDs that should be "never allow a firmware to be moved to
> the stable remote if it uses this GUID" or more "a firmware also needs
> a DMI restriction before being allowed near stable"? I'd err on the
> former for these.

TBH those are GUIDs that are used by virtual devices. It wouldn't hurt
if someone reused those GUIDs but we can display a warning about it?

>
> > I've cc'ed all the people I could find in board specific MAINTAINER files.
> > Can you respond to Richard with the proper company name & board name
> > so we can bind the following GUIDs to a vendor properly?
> > Richard any guidance on how this should be done properly is
> > appreciated, since I am not too aware of LVFS internals.
>
> The LVFS doesn't need "pre-registration" of GUIDs so to speak; we have
> have two deny lists of GUIDs -- one for "this is never valid" and one
> for the "this needs a DMI match"

Ok thanks for the info. Is there also a check of "I have duplicate
GUIDs that aren't in the DMI list'?

>
> > STMicroelectronics STM32MP_FIP_IMAGE_GUID 19d5df83-11b0-457b-be2c-7559c13142a5
> > This seems to use the same GUID for multiple device variants. This
> > needs to be fixed
>
> Is the DMI data different? e.g. you can see the Windows CHIDs (we use
> the same DMI restriction scheme as Window 10) using
> ComputerHardwareIds.exe or on Linux using `sudo fwupdtool hwids`

I hope ST answers that, they are cc'ed

>
> I've created a spreadsheet of what we do now, please feel free to add
> GUIDs (anybody!) to the correct column:
> https://docs.google.com/spreadsheets/d/1uPQmUrGA1KKsDPzGeg4xb2XOQEfsjDBBP9SQjqh31Wc/edit?usp=sharing

Thanks!
/Ilias
>
> Thanks,
>
> Richard.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
