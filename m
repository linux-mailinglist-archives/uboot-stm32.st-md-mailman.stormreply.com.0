Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A72DECD9
	for <lists+uboot-stm32@lfdr.de>; Sat, 19 Dec 2020 04:24:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A880C5717E;
	Sat, 19 Dec 2020 03:24:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7172CC5717D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Dec 2020 03:24:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id e25so5216116wme.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 19:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RfEHukQ5/5Quy1Sg2aENUFscF45BXXe6kXLuw46Yymo=;
 b=Mxe97W4ZYDn5IuIhzxUdMALV5MWRSIauvBTzqx1vNKEpHkde/jG2H2XObFurBUWD+5
 hqO13FLjtJRmZJ4u+7QanuvPWEXKuoWA6vzUZNE0it2531EnoEF1FYTu2CMQJowXqE9a
 KugTLTx4/7nYidxL9URMxdhMXbAAhQxylVL3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfEHukQ5/5Quy1Sg2aENUFscF45BXXe6kXLuw46Yymo=;
 b=J8klf0UthOdEKS0+muAISXQuZyPWHCf3u60F0vaHRMilfancnfLoIB4SvH+E8f4gVw
 JQxneznH5aAVl7vMGwmFBoYCD+6gaFqs56MhopTdw7o9k3nre0FX6Ao88Jj527/LOiTj
 0EbC8Qz5lLY/sOwyBwgRQJF0kVC4l3KrYM7Bm4W4VKkX7E+QcCr0CZZ04e/jK56erI71
 6z3M8xgwMujNC76XFefuSWeHEBKn7oQk3T0eNzP+k4tIQHueT8Pbe+qPR7Rp2ZQ4l+5L
 LTUzqEoF1MwhaeBspc/QBz+zhSw9/6MupJ/vfbitg7aZ7KlaZjwCgBIRR1/vD+iZdwyc
 c3PA==
X-Gm-Message-State: AOAM531rbXiCQodKAq9saWbVILdt3rRF/u7eJps8Xrm6UKVT5f+FHi5W
 /FE29uoQuphZb/JV9kZJFasGVDTBpZCFJoOuH0f4/w==
X-Google-Smtp-Source: ABdhPJzgWx3NhNFzBs2LLO0wbqCKarY/nbOOBgzy2xzNIsvtJh8wl4B9Es/BYItxN6tCLxxkYxsyzwCCzDkCvFUMtn0=
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr6716264wmg.168.1608348255530; 
 Fri, 18 Dec 2020 19:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20201127104930.32692-1-patrick.delaunay@st.com>
 <20201127114927.2.Ida70f4fb1524187703e9240d63e436f8ae5adaab@changeid>
 <CAPnjgZ10epegATj3mBvjh0uLchyt9jGzAPt0KaF=NJ2FVNQHBQ@mail.gmail.com>
 <1606917178506.76711@st.com>
 <CAPnjgZ0O_jY2K5XsU+i3sgwn_P0NM41HfTbv6jLF3JBOeQTW_Q@mail.gmail.com>
 <f9e23010-0ea4-f236-3b65-54eb59eb9738@foss.st.com>
In-Reply-To: <f9e23010-0ea4-f236-3b65-54eb59eb9738@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 18 Dec 2020 20:24:03 -0700
Message-ID: <CAPnjgZ1KwrSYJBj370RxkdrdKKRDpAv8t+SuvDMoOXOWh4qxUQ@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] console: sandbox: remove unnecessary
 sandbox code
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

Hi Patrick,

On Tue, 15 Dec 2020 at 07:35, Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi Simon,
>
> On 12/12/20 4:39 PM, Simon Glass wrote:
> > Hi Patrick,
> >
> > On Wed, 2 Dec 2020 at 07:08, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
> >> Hi Simon,
> >>
> >>> From: Simon Glass <sjg@chromium.org>
> >>> Sent: lundi 30 novembre 2020 21:12
> >>>
> >>> Hi Patrick,
> >>>
> >>> On Fri, 27 Nov 2020 at 03:49, Patrick Delaunay <patrick.delaunay@st.com>
> >>> wrote:
> >>>> Remove the specific sandbox code in console.c, as the config
> >>>> CONFIG_DEBUG_UART is already supported in drivers/serial/sandbox.c and
> >>>> activated by default in all sandbox defconfig
> >>>> (CONFIG_DEBUG_UART_SANDBOX=y and CONFIG_DEBUG_UART=y).
> >>>>
> >>>> This patch allows to test the console code under DEBUG_UART in sandbox
> >>>> and avoids to include the file <os.h> in this u-boot generic code.
> >>>>
> >>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> >>>> ---
> >>>>
> >>>>   common/console.c | 15 ---------------
> >>>>   1 file changed, 15 deletions(-)
> >>> Please see this commit as to why I put that code back, after removing it myself.
> >>>
> >>> 64e9b4f346f Revert "sandbox: Drop special case console code for sandbox"
> >>>
> >>> Regards,
> >>> Simon
> >> Thanks to point it, I miss this old commit.
> >>
> >> I don't understood the issue in the commit message:
> >>
> >>      Revert "sandbox: Drop special case console code for sandbox"
> >>
> >>      While sandbox works OK without the special-case code, it does result in
> >>      console output being stored in the pre-console buffer while sandbox starts
> >>      up. If there is a crash or a problem then there is no indication of what
> >>      is going on.
> >>
> >>      For ease of debugging it seems better to revert this change also.
> >>
> >> the existing code (here for putc, but it is the same for puts)  is:
> >>
> >> #ifdef CONFIG_SANDBOX
> >>          /* sandbox can send characters to stdout before it has a console */
> >>          if (!(gd->flags & GD_FLG_SERIAL_READY)) {
> >>                  os_putc(c);
> >>                  return;
> >>          }
> >> #endif
> >> #ifdef CONFIG_DEBUG_UART
> >>          /* if we don't have a console yet, use the debug UART */
> >>          if (!(gd->flags & GD_FLG_SERIAL_READY)) {
> >>                  printch(c);
> >>                  return;
> >>          }
> >> #endif
> >>
> >> For sandbox, when CONFIG_DEBUG_UART is activated
> >>      printch => _printch => _debug_uart_putc => os_putc
> >>
> >> For me these 2 code block are identical for sandbox when CONFIG_DEBUG_UART
> >>
> >> And the  issue described is also solved by CONFIG_DEBUG_UART=y
> >> (consle no use preconsole buffer when serial driver s not ready).
> >>
> >> Your concern  is when sandbox is compiled without CONFIG_DEBUG_UART ?
> >>
> >> Because it is no more the case with my previous patch (I activate it in sandbox*defconfig)
> >>
> >> but to avoid issue in futur (new sandbox*defconfig) it should be better to select (or imply)
> >> his feature for sandbox  arch in Kconfig and not more activate it in sandbox*defconfig ?
> >>
> >> PS: with this sandox code, I don't see how to test the pre console buffer in sandbox...
> >>         I think that the pre console buffer is alway empty for sandbox
> >>
> > OK maybe things have changed. Previously I noticed that the banner did
> > not output until later. I will take another look.
> >
> > But I don't want to rely on the debug UART for sandbox to work.
>
> Ok, it is not problem for me (avoid assumption on CONFIG_DEBUG_UART for
> sandbox)
>
> you can consider that I abandon this change.
>
> I will only replace
>
>         #ifdef CONFIG_SANDBOX
>
> by
>
>         if (IS_ACTIVATED(CONFIG_SANDBOX))
>
> in the other console the cleanup serie "console: remove #ifdef CONFIG when it is possible"
>
>         http://patchwork.ozlabs.org/project/uboot/list/?series=218309

OK good.

Just to close the loop, if I disable the debug UART, and put a
printf() in a suitable function before console_init_f() -
e.g.initf_bootstage()

Then print_pre_console_buffer() prints out the text, but it does not
appear before that. I consider that confusing/annoying when using gdb
with sandbox, which I why I reverted my original patch.

I am not a fan of special-case sandbox code, and there is probably a
nicer way of doing it, but I do think having this special case is
worth it.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
