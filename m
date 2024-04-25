Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF498B36BF
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 13:54:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EF63C71292;
	Fri, 26 Apr 2024 11:54:18 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7742AC6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 12:28:46 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-78edbed6e86so18947885a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 05:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714048125; x=1714652925;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nrFmNE0Pl2LKLdp5FVZBIfOlpjXBRKjDy1Ug7iTCGJA=;
 b=GTGst0NshjZsBnkv0WOQbEC9Ho3xVJv55YYkrgr0Nma9Z+DFDTUzi9N8mlpIdaHfyO
 nrykZiMHl3NdtrHqiUXImhmCm6M2D1ym5QGZeAdbw+wTr/hXHDAtmfKx6TQ3AivN5Sx5
 8CuHJDtdHqWXS4ylBeco9f5LT3VszoY/m8tpMKoCDpKJX42UrIFxg3TG8GkDA5vlrABS
 4cP0wWsH9WC6NPFE7I8MNOTE4XFY83Fx0TDph89eBF6GDaD8U0vXLUOJX+h1Ng/qjqHW
 28O+q5ohxbrw5NVxvAT0d9mTVghJdW+ZhlWqpH11ByHEkUC6mKBC4H/NqL8w4NKVrU1O
 /ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714048125; x=1714652925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nrFmNE0Pl2LKLdp5FVZBIfOlpjXBRKjDy1Ug7iTCGJA=;
 b=QHrC0FZW/hkLhNcm2278903Hcmr3qPny/l1fLlYK87fYO2Og8zUGla1QdNw6OI68Yl
 8P5vVcpb5m1SBBqaJWMT53rA4Y5jUF+s169cjfxwNI9Rtdj56YcaaQPvQ6IQlCWqKxvg
 U3zul1i86X6QlSIsZAzMI2zim/yoUwy2fdOEt90U5JQXHpfzqYOf8hXMq2uiAjbitBbh
 pMj3106N4OUoNHZyhqfh8ioGU4UmQGsVL0vOEl4qb2+MWRZK6foVBKK8rt3udD1qwyJM
 Wq3FgnWMEfR8YkxHcVIdRVry9sQaZPCkt2quarBgl/AqPfEarfQ5AKsQwpqHcXUA6nO6
 5qEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgZD6W25V2DK9mrEpuuCxGXCF4ndLIkT6scNoAnbN4YGy6ef8PY5mdbatvnpxGH3TRtNf/bGFrY9Eul4tQS/47YBO2kL6qX4lK7fSMvIlzJWi5XRQu4trJ
X-Gm-Message-State: AOJu0YzokKbucEYzGQy6okrsR0oxzH0xwaUIsNPr8Rrddf0CfdLg+oFE
 hJ+6zHr8XCADPrt9e/u0xEKUgVycElM5XheUHRK6ZYFPrRGmPT+L8+9IDN3DS9Dw6kBPBHSyeqr
 crMmhR2+E+JVpxkhHzlXb+U1BiY0=
X-Google-Smtp-Source: AGHT+IETiFq9ez8QXYJEjSMhSa4dedCWNrOi9mJ3Iwhg4SHfQgXLgwbuB1L/JFE8l/nkDYvDGorZxixTiFLAQ2+MebM=
X-Received: by 2002:a05:6214:258a:b0:699:dfe:6015 with SMTP id
 fq10-20020a056214258a00b006990dfe6015mr5781064qvb.5.1714048125128; Thu, 25
 Apr 2024 05:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
In-Reply-To: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Thu, 25 Apr 2024 13:28:33 +0100
Message-ID: <CAD2FfiGuFaC=r+TGfq9auzWJbyzVNbug8zR9RzSwM2+Uk52d+Q@mail.gmail.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
X-Mailman-Approved-At: Fri, 26 Apr 2024 11:54:16 +0000
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

Hi all!

> Any ODM/OEM creating a board
> based on the original device must use his own
> GUIID to avoid confusion. If not we would end up with different
> devices reusing the same GUIDs and upgrading their firmware with a
> different one.

Yes and no. Of course it's never okay for vendor A to use the same
GUID as vendor B -- but if vendor A has two models of hardware (for
instance model C and model D) they can have the same capsule GUID if
the update can use a DMI match on the product SMBIOS key to identify
the system. Of course, it's much better if they have different GUIDs
in the ESRT to completely avoid the chance of the wrong firmware being
flashed on the wrong device.

> Richard, the following GUIDs should at least issue a warning in LVFS
> since they only work for QEMU & Sandbox internally.
> Sandbox SANDBOX_UBOOT_IMAGE_GUID 09d7cf52-0720-4710-91d1-08469b7fe9c8
> Sandbox SANDBOX_UBOOT_ENV_IMAGE 5a7021f5-fef2-48b4-aaba-832e777418c0
> Sandbox SANDBOX_FIT_IMAGE_GUID 3673b45d-6a7c-46f3-9e60-adabb03f7937
> QEMU QEMU_ARM_UBOOT_IMAGE_GUID f885b085-99f8-45af-847d-d514107a4a2c
> QEMU QEMU_ARM64_UBOOT_IMAGE 058b7d83-50d5-4c47-a195-60d86ad341c4

Are these GUIDs that should be "never allow a firmware to be moved to
the stable remote if it uses this GUID" or more "a firmware also needs
a DMI restriction before being allowed near stable"? I'd err on the
former for these.

> I've cc'ed all the people I could find in board specific MAINTAINER files.
> Can you respond to Richard with the proper company name & board name
> so we can bind the following GUIDs to a vendor properly?
> Richard any guidance on how this should be done properly is
> appreciated, since I am not too aware of LVFS internals.

The LVFS doesn't need "pre-registration" of GUIDs so to speak; we have
have two deny lists of GUIDs -- one for "this is never valid" and one
for the "this needs a DMI match"

> STMicroelectronics STM32MP_FIP_IMAGE_GUID 19d5df83-11b0-457b-be2c-7559c13142a5
> This seems to use the same GUID for multiple device variants. This
> needs to be fixed

Is the DMI data different? e.g. you can see the Windows CHIDs (we use
the same DMI restriction scheme as Window 10) using
ComputerHardwareIds.exe or on Linux using `sudo fwupdtool hwids`

I've created a spreadsheet of what we do now, please feel free to add
GUIDs (anybody!) to the correct column:
https://docs.google.com/spreadsheets/d/1uPQmUrGA1KKsDPzGeg4xb2XOQEfsjDBBP9SQjqh31Wc/edit?usp=sharing

Thanks,

Richard.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
