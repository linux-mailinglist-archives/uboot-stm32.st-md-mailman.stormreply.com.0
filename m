Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E9A8B36BE
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 13:54:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67390C71294;
	Fri, 26 Apr 2024 11:54:18 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67F67C71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 14:13:21 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7908be77e6eso6019285a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714054400; x=1714659200;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+oQtck/diSK1qjx29Nb0NcKkDmFbXQpeKwMz4JSrmdA=;
 b=ZFEpuzpehxIuB1MW8WLJ0Ao6kzXgJhdL/AIxlnbIrzrG4Cd1c9G8LxLpDHndQGcA5s
 u6VhRwgCi8EyelV0MeoSmpCu1SfZtsXNh/RWWROw8BxGT6JMC8PVGUf5wFMYRrDq3TAc
 vRCkSgoFP1VieAW+b0GMTa2xuU2KWZ4A6Vf5SzEgEouaT3KCYYdxIksx4RY+syDVGNT2
 hhRWXbWYklMIikhYSlIBNd6UFld4W9ytdXbKmCjSaIstIhKBjk0TxolILBK3W0rQuOqn
 TvR8p179uaG0Ma6M0BKs3NQmv4nLPv0oU82R2l8gV6EMt+rMsl1YXPWs8h69aJyDscsh
 0bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714054400; x=1714659200;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+oQtck/diSK1qjx29Nb0NcKkDmFbXQpeKwMz4JSrmdA=;
 b=woi+HRA4Pd6/4u+cWhvPEzFZiGFLRYIvJ2nswifYIGAl5L79xdn7alNnbrsR99K+Xb
 45eUR8F+1mVR2p7KXn2Yu7bcD8z3ZAv4FdI6GaAH5GtyHuCN+SpxjjV25IRuN+6hmqlZ
 xP7uTn6fj9JBQpYYVII1r4OCP+fQbDD0dKJEQRKR+y5e2ZBPAyFQhVsOl1zZVduRZg2a
 VOIN0SEYt9Zft/j0K6w1fiWDl4Q2VEUpuMtv4JxByuH+iZ5QJOSfOnkXF3uuicy565J0
 PzjcXryZXmoc3x2qmmJIex1MIRLHuI1PNitbRkFnD21aG6Jrr+WwzYDM4pOhMEIaGBlm
 dLUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwEL2+NKas+Q5PRhyOo7+EaEVXowtuaZhNeRV4Zrp7M5OX10A/j907JxS6znvzS0qq5wHyFMcVJBEmx9ijFdHoIeBLZ8+eaq4SkZSkH2Pvv3FpD9SkhqxE
X-Gm-Message-State: AOJu0Yxt7KzLiCP+9pimltW0bvClq95PNZZsDl1TfctlBlwqwEU3ZmD9
 bDtMM1V8hNyETfMm0vQyJu6TvcNh43X4fnKcWUZxDX22ryJ/NpPkunzACx6ppJOjXhkFn8PIm1O
 naz9DYyHdS3MpdPmHl82KEhAqICE=
X-Google-Smtp-Source: AGHT+IFS8t904r8HE5VnHqzgtvD9F/u4WQdBkfmNmFZT2YHGyl+k2wEZ2LXsOdfqv8Y0fe6mtIZJHnVatny4gT1ICoU=
X-Received: by 2002:a05:6214:f0f:b0:69b:1c78:158a with SMTP id
 gw15-20020a0562140f0f00b0069b1c78158amr6097313qvb.3.1714054400011; Thu, 25
 Apr 2024 07:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
 <CAD2FfiGuFaC=r+TGfq9auzWJbyzVNbug8zR9RzSwM2+Uk52d+Q@mail.gmail.com>
 <CAC_iWj+BonsVbA5Bw3Kck2k4b8SXru0U_Y2kAmx5=_t6SozotA@mail.gmail.com>
In-Reply-To: <CAC_iWj+BonsVbA5Bw3Kck2k4b8SXru0U_Y2kAmx5=_t6SozotA@mail.gmail.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Thu, 25 Apr 2024 15:13:07 +0100
Message-ID: <CAD2FfiH46mtwPB_wR9H2p6hKCT5eLu5UOyHNDvpdpgFEAdqBuw@mail.gmail.com>
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

On Thu, 25 Apr 2024 at 14:46, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
> TBH those are GUIDs that are used by virtual devices. It wouldn't hurt
> if someone reused those GUIDs but we can display a warning about it?

Right, I've added some of those to the spreadsheet "never" column.
They'll work for testing purposes but they can't be pushed to public
remotes.

> Ok thanks for the info. Is there also a check of "I have duplicate
> GUIDs that aren't in the DMI list'?

Yup, we check that components with duplicate GUIDs don't have
different AppStream IDs or different sets of HWID requirements.

Richard.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
