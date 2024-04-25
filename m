Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6D38B24D6
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Apr 2024 17:16:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FDDFC71292;
	Thu, 25 Apr 2024 15:16:15 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3282FC71290
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 15:16:15 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-56e1bbdb362so1348081a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 08:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714058175; x=1714662975;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cB8eb8qsermhTEOTejDHbWXNvO6PPk/VFIKOHXqqMoI=;
 b=C+JUumVs+sg+VGHSmH6y7jc5ViMTK0WYT2HPgV2Fpttl0m0I3izhHX2P4q1IR+nfz/
 1i1AuYhzgmRIM/YPbCpE1JQdWXGDKmPqJiOzQNekLzm6h7ZKGZHFW3KjiNxQvMFJ7J/v
 dyW6W6yOepPP7DB0HRbSCVw4cHwD6Psc2s/AUsz206RgC9MYEqkVD89CWqaQoSE08AeJ
 Eit+DdatT3tLfgqn0nMvQnO4Is7Os7iSYT2SoB+tlJwkdurLX6AdsAiWIgNhNJjjOVW5
 YTtmjkjp/ZNQdXh+iT7qurEl6gS9pnXOeMdWXcZEg9dYU3/FwuaGRksbs96j/vaWaam4
 fd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714058175; x=1714662975;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cB8eb8qsermhTEOTejDHbWXNvO6PPk/VFIKOHXqqMoI=;
 b=lVJRfDtgUoRRjE1kCDx8ltvFuBpklvZJ20h92ZkmIfMTF3FDmj1SL6waDAkN/83LR4
 4bod8cNiSho/w6WYt0YmQ0EjOJssivO2lbCm024cu6ENOTsuK7JG1k0kHvuoGQV1Ey8w
 kQ5xZ/Wnh1H42T/ZmHqHPMymMmDDaQd0qs3nDAp73ycVBvCXAvZ464R/2O45vQJksY9j
 H1hG/ZfvUk0i1LcS7rEIbVciTPqhei6C61OU0L3t69PtsP4g113dMuqnUEWDxQShN3UR
 TXnzpEDPXn+2RU89EBPGRn7GrzsNSB0jHKj8uGbrojMiTlOXIwjF76URK6pBcZ63Vd8F
 uiJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvBnRq4/45uh+kwh61PnZxVjdS6EVMQpf3d4+qJaNydqj1C7/FP3msFhr++HdOkjCN2Ok+gGw2zjK2pVel6zStZ+2Py9CD2JWq0lC0OOVINSsjOzpoveju
X-Gm-Message-State: AOJu0YzI7LONc+fissb9V1uIKudJgJ9TF9oHOQ91gICii5T5hCnrf2DT
 k1yri31XH0ncteF4m9UHIkt/gHRJEWhWUklD/s4yH04ZXQD0eA/qbMvQ22ppebI=
X-Google-Smtp-Source: AGHT+IFOvHQzBRPQKQl79GYWUtYBnpYMjqpCX6sQl05Myy6BRDsYOHh73b3fJTzqZ7SrAxTglFjJTw==
X-Received: by 2002:a50:c059:0:b0:570:35e:9a09 with SMTP id
 u25-20020a50c059000000b00570035e9a09mr261501edd.7.1714058174449; 
 Thu, 25 Apr 2024 08:16:14 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::dcdd? ([2a02:8109:aa0d:be00::dcdd])
 by smtp.gmail.com with ESMTPSA id
 b10-20020aa7dc0a000000b0056fe755f1e6sm8973972edu.91.2024.04.25.08.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 08:16:14 -0700 (PDT)
Message-ID: <cd5ca19b-befe-47cf-9a84-f610ae7f04c9@linaro.org>
Date: Thu, 25 Apr 2024 17:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Richard Hughes <hughsient@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
 <CAD2FfiGuFaC=r+TGfq9auzWJbyzVNbug8zR9RzSwM2+Uk52d+Q@mail.gmail.com>
 <CAC_iWj+BonsVbA5Bw3Kck2k4b8SXru0U_Y2kAmx5=_t6SozotA@mail.gmail.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CAC_iWj+BonsVbA5Bw3Kck2k4b8SXru0U_Y2kAmx5=_t6SozotA@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi all,

On 25/04/2024 15:46, Ilias Apalodimas wrote:
> Hi Richard,
> 
> On Thu, 25 Apr 2024 at 15:28, Richard Hughes <hughsient@gmail.com> wrote:
>>
>> Hi all!
>>
>>> Any ODM/OEM creating a board
>>> based on the original device must use his own
>>> GUIID to avoid confusion. If not we would end up with different
>>> devices reusing the same GUIDs and upgrading their firmware with a
>>> different one.
>>
>> Yes and no. Of course it's never okay for vendor A to use the same
>> GUID as vendor B -- but if vendor A has two models of hardware (for
>> instance model C and model D) they can have the same capsule GUID if
>> the update can use a DMI match on the product SMBIOS key to identify
>> the system.
> 
> In theory, yes but we don't have any of these check in u-boot and I'd
> rather avoid them and do it properly

I discussed an idea with Ilias to generate GUIDs dynamically based on 
the board compatible/model, which seem to essentially just an 
abstraction on this.. But I'm wondering now if it wouldn't be better to 
do DMI matching.

Like, if we have a GUID of some specificity (OEM, ODM, mach, whatever), 
and the DMI data (usually root compatible and model, but easily 
extensible and overriden by board code) then we can do the exact same 
matching, but with the added bonus of being easily able to tell what's 
up if something doesn't match. Generating a GUID from this data makes it 
way more difficult to figure out why the board doesn't match.

But the issue there I guess is that the EFI spec only allows for 
identifying by GUID and not any other data...
> 
>> Of course, it's much better if they have different GUIDs
>> in the ESRT to completely avoid the chance of the wrong firmware being
>> flashed on the wrong device.

So expanding on the above a bit, the idea Ilias and I brainstormed was 
to use v5 GUIDs (which are deterministic based on a "salt" GUID and some 
arbitrary data which is hashed together). We would use the board model 
and compatible, as well as the firmware image name to generate these.

Then for every board we want to support in LVFS we just boot it, dump 
the geenerated GUIDs, and use them. This makes changing the 
model/compatible strings a little bit annoying but it's workable.

I feel like this is a "clever" solution to the issue of all these 
hardcoded GUIDs (and needing to add new ones for every board, even if 
the board otherwise requires no code changes in U-Boot). But it also 
feels kinda ugly in how it's just a worse version of the DMI matching 
fwupd can already do.

> 
> Exactly.
> 
>>
>>> Richard, the following GUIDs should at least issue a warning in LVFS
>>> since they only work for QEMU & Sandbox internally.
>>> Sandbox SANDBOX_UBOOT_IMAGE_GUID 09d7cf52-0720-4710-91d1-08469b7fe9c8
>>> Sandbox SANDBOX_UBOOT_ENV_IMAGE 5a7021f5-fef2-48b4-aaba-832e777418c0
>>> Sandbox SANDBOX_FIT_IMAGE_GUID 3673b45d-6a7c-46f3-9e60-adabb03f7937
>>> QEMU QEMU_ARM_UBOOT_IMAGE_GUID f885b085-99f8-45af-847d-d514107a4a2c
>>> QEMU QEMU_ARM64_UBOOT_IMAGE 058b7d83-50d5-4c47-a195-60d86ad341c4
>>
>> Are these GUIDs that should be "never allow a firmware to be moved to
>> the stable remote if it uses this GUID" or more "a firmware also needs
>> a DMI restriction before being allowed near stable"? I'd err on the
>> former for these.
> 
> TBH those are GUIDs that are used by virtual devices. It wouldn't hurt
> if someone reused those GUIDs but we can display a warning about it?
> 
>>
>>> I've cc'ed all the people I could find in board specific MAINTAINER files.
>>> Can you respond to Richard with the proper company name & board name
>>> so we can bind the following GUIDs to a vendor properly?
>>> Richard any guidance on how this should be done properly is
>>> appreciated, since I am not too aware of LVFS internals.
>>
>> The LVFS doesn't need "pre-registration" of GUIDs so to speak; we have
>> have two deny lists of GUIDs -- one for "this is never valid" and one
>> for the "this needs a DMI match"
> 
> Ok thanks for the info. Is there also a check of "I have duplicate
> GUIDs that aren't in the DMI list'?
> 
>>
>>> STMicroelectronics STM32MP_FIP_IMAGE_GUID 19d5df83-11b0-457b-be2c-7559c13142a5
>>> This seems to use the same GUID for multiple device variants. This
>>> needs to be fixed
>>
>> Is the DMI data different? e.g. you can see the Windows CHIDs (we use
>> the same DMI restriction scheme as Window 10) using
>> ComputerHardwareIds.exe or on Linux using `sudo fwupdtool hwids`
> 
> I hope ST answers that, they are cc'ed
> 
>>
>> I've created a spreadsheet of what we do now, please feel free to add
>> GUIDs (anybody!) to the correct column:
>> https://docs.google.com/spreadsheets/d/1uPQmUrGA1KKsDPzGeg4xb2XOQEfsjDBBP9SQjqh31Wc/edit?usp=sharing
> 
> Thanks!
> /Ilias
>>
>> Thanks,
>>
>> Richard.

-- 
// Caleb (they/them)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
