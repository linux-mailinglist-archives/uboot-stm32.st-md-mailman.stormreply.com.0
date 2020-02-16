Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E17F61605A9
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Feb 2020 20:03:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A506C36B0B
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Feb 2020 19:03:05 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BA34C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 19:03:00 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i1so14655571oie.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 11:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1JnGC3QJA08GeibuQkMKeGnHaMKnvfK9p0/Cnqgy/X0=;
 b=kS17ujekHLZ/9EdVtituJUNSr4J9Ek/MbKwAbXZVcAuWFM1PGSnlONWNCO9t8W3bQz
 hOq7+M6ghDyEd+11kzS+O2yLI9wCFH+LEmULmwWd7yGjV3fJ0e6BQTxRoyUu+Jis5j/C
 EQCNf/pD2NSz/VlPp/4616AJqxw/5nhiCsi20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1JnGC3QJA08GeibuQkMKeGnHaMKnvfK9p0/Cnqgy/X0=;
 b=B+qeWtEK4DAjeumJYjdfwDyIE2tHdPyMZRMBXuq15nkrqBjdVJgUi3Ir5DyglFZ9EI
 imGfaqpWs2xlyY2p36EplENENgj41msKjhiT1eGaMz/eAhxGrTkGclHMZJJUyp7JXfot
 Lbt/zzxJNXSMf+GSTERhNav4fzyaJFD/x35/SA2A/FtZMqSH4YPcPFe6BK9J9tzsOihW
 WOWmpf6lzzlOBx73ea7IthQdAAAKtsWQq9ieVjGh6Nx4RMCsIei2wDT8Srt1twgIbGOw
 2K0UncrNTd1z1H6tPpTK3yj9+9SfqgqbQKQzGYzvUbYx6bd3ihoUSBspj6cV2huYIYbH
 upHw==
X-Gm-Message-State: APjAAAWiBBIWGk037zkp3Zk7C3OudDFBD/dIfHwPukVCVSmDY40MUs1V
 1oluhZXr4TbAP/XjDtHc6ZI1070YT/JXbplmsu8vrYH5
X-Google-Smtp-Source: APXvYqxEeSwm8ZUqJLAOSgxYMRTZQi5AY4cjQhNGY887ry9faF+W8Lr4ROXCVobkTU9cZoPvGWl6cqpZWo3w8bhagCY=
X-Received: by 2002:aca:ab53:: with SMTP id u80mr7733065oie.94.1581879779230; 
 Sun, 16 Feb 2020 11:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20200212184501.5911-1-patrick.delaunay@st.com>
 <20200212184501.5911-5-patrick.delaunay@st.com>
In-Reply-To: <20200212184501.5911-5-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 16 Feb 2020 12:02:45 -0700
Message-ID: <CAPnjgZ0SwWxAT0395aC3T2Ltdcp-JJNqWMttwfzxb5HYLqsU6g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [RESEND PATCH 04/10] sandbox: activate env in
	ext4 support
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

On Wed, 12 Feb 2020 at 11:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> The default environment is still used with "ENVL_NOWHERE"
> indicated by the weak function env_get_location() and
> activated by CONFIG_ENV_IS_NOWHERE.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/sandbox/sandbox.c            | 12 ++++++++++++
>  configs/sandbox64_defconfig        |  4 ++++
>  configs/sandbox_defconfig          |  4 ++++
>  configs/sandbox_flattree_defconfig |  4 ++++
>  configs/sandbox_spl_defconfig      |  4 ++++
>  5 files changed, 28 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

At some point I'd really like the environment device/info to be in the
device tree.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
