Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E28B36C0
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 13:54:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F30BC71296;
	Fri, 26 Apr 2024 11:54:18 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F514C71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 16:13:35 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-69b206d8c45so542046d6.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714061614; x=1714666414;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U2PQX4SkDf/EzV28YNsTNC5RWWz59W783pHKrVePLfQ=;
 b=ZbQ/u6eDmdHSC9qDSw4muwVmZPVFfVSqgvuXlEEZk1oHNioLL9AzQekgns0/STDusl
 oIU8sSy6z8xXd2brnxhWI9nw65oh34YRtAvhf7+K13WL2MnjZtsy/nhH1Wi504eY4Uq7
 M8Jsk+we5guZTT/0SCJIzJn7F1NskvMiw0Ukl9cYdtL2WgT6WEb4bievEPuUmhknJrLe
 J4rSNcor5XoUeExBAj2/NPDiz/svAWNncE/WyN6F6BttvdR5Cj3TtCKA9pPXNxPKGozQ
 zeMSe9TlVJtVOlXUhdvApTy1ze19xll2pa2v73rKSGo5rg4zJCSrvThOpX6vBgSbHjs3
 18FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714061614; x=1714666414;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U2PQX4SkDf/EzV28YNsTNC5RWWz59W783pHKrVePLfQ=;
 b=S2+MbxrKq7TBYS5+ychUnOv07KgbQbhO1YBMU1sCtFN5sMh0AjVyc4JMGrLVqhobGe
 TLgIQu0MYwr4P41vvPr7eI8Rf00tQRtNOVzcUeTYs5gdNfMyQyF3hBst1z72EcmH8m6p
 c4Pb1IwtdQmzRz7OayJPgAARKf4BRdvwDNJfUovcfkMAnpWoQl0kSUp7/Em7wDIjwbQy
 +q9B3BDlU/KvAZSNaaLemDNf1u2xBshX1luNr55a3wybJ1FjRGIXPneTx8mMR2oG4zCJ
 uQmH1TpCm9hIqQ3qb5qQBlkkTFI3C79P3rBLEux3+bccZ/nyJXow4tnEVFg1OlXZR8Vk
 TEBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPOZkgHZQ2SeQAmFhv4pEfx7hCBJtBAiTt5y2dzCeOTr1apnxBTku61Kuv58Vb2OEbI2RE1e3YMufMj2AwIJ4YW5UHeIpE00emxfybuGrSbFQFYouk0S8X
X-Gm-Message-State: AOJu0Yy3RhFOFZdaEDExH6U5vVojMwk+GPLQXY+asl9TTevIn8UUHxWS
 eHwIn2nX7hPxlz7Fe0UQGA6oKpDD0J/0W0ujnvBWGBAxqwlKSkVmA0lRjaPLQYPa1SR0fv4PJAc
 N1DEB3pxoVda8IoUf11PHG1bkUWI=
X-Google-Smtp-Source: AGHT+IEE2nxUGaw91/m4nNn5traNusLve8+k8ZVX8nHTnpyYcNJPocB8r8U0fIag9Z195L9s0nBds8IpQ2d8LTw/zNk=
X-Received: by 2002:a05:6214:27c9:b0:6a0:a98a:481d with SMTP id
 ge9-20020a05621427c900b006a0a98a481dmr16775qvb.2.1714061614494; Thu, 25 Apr
 2024 09:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
 <CAD2FfiGuFaC=r+TGfq9auzWJbyzVNbug8zR9RzSwM2+Uk52d+Q@mail.gmail.com>
 <CAC_iWj+BonsVbA5Bw3Kck2k4b8SXru0U_Y2kAmx5=_t6SozotA@mail.gmail.com>
 <cd5ca19b-befe-47cf-9a84-f610ae7f04c9@linaro.org>
In-Reply-To: <cd5ca19b-befe-47cf-9a84-f610ae7f04c9@linaro.org>
From: Richard Hughes <hughsient@gmail.com>
Date: Thu, 25 Apr 2024 17:13:21 +0100
Message-ID: <CAD2FfiELXfvc9jEDpKVx44BnK5yDpVViARkB0QrHkpMRrdsVEA@mail.gmail.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
X-Mailman-Approved-At: Fri, 26 Apr 2024 11:54:16 +0000
Cc: Tom Rini <trini@konsulko.com>, Jonas Karlman <jonas@kwiboo.se>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
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

On Thu, 25 Apr 2024 at 16:16, Caleb Connolly <caleb.connolly@linaro.org> wrote:
> I discussed an idea with Ilias to generate GUIDs dynamically based on
> the board compatible/model, which seem to essentially just an
> abstraction on this..

Yup, that works too -- on the assumption the compatible string is unique enough.

> >> Of course, it's much better if they have different GUIDs
> >> in the ESRT to completely avoid the chance of the wrong firmware being
> >> flashed on the wrong device.
>
> So expanding on the above a bit, the idea Ilias and I brainstormed was
> to use v5 GUIDs (which are deterministic based on a "salt" GUID and some
> arbitrary data which is hashed together). We would use the board model
> and compatible, as well as the firmware image name to generate these.

So that's kinda like Microsoft CHID, and I'm wondering why you
couldn't just use one of the GUIDs from `sudo fwupdtool hwids`
actually *as* the capsule GUID.

Richard.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
