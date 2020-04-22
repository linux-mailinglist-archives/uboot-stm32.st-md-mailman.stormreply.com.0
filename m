Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C85BB1B4A95
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 18:33:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BC5CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 16:33:05 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D886C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 16:33:03 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z17so2549031oto.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l4TRRhIWGRwGl0wQWTfzbgckqtJvX80Z8sLUaY6AEOk=;
 b=gh2amTb9cJ6S+KGJzlChEla9UWaXOX+wN5N9GyBnIZmA9auZQY5cIQ7NLStHAWJcRJ
 PaBsCvp2KATUa0oGhc6uyfty8yyT8Pi443FxlNpJkTn0EZ98gJmd4TxJz+iV80ykjlwu
 bKH6CBab0NbHUPoZxi8zP1Hi46qsjHz7WkuB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l4TRRhIWGRwGl0wQWTfzbgckqtJvX80Z8sLUaY6AEOk=;
 b=eI29chTebNYzW1t+1RdYPslKPyII+RaXtNZwr3ajUYbg9imods4V1aHyJ2k52euzGW
 qLCvDNSrlEu2A8t8x11alpz+ncZJ6BtgQK7CepXf7kuYw8wb0lT3wZ/ZsV0LkUZijZtK
 MpFWwPIBPGb/XyhMczhcE7PzW/usrQUAjgmpkcNvxQWbaosn3BzzyTMayRuCpFT+uGGq
 GnjTySQB6IqrFA5ascsDo6PVfonrNmtQHej0zZFqw9VypW5w4+NZVTU9+113BWH6+jJ/
 nHqTpWyEByaUVLkUb4n1EDwcfi59i8vJR9QWzOF8uDgrdDzV/pHvnz4hPMmKhH1LGaux
 ybSQ==
X-Gm-Message-State: AGi0PubW9LCreLvRF9QpkDwhLWDqIyIMxBmJ+9qQeFf4rWlwBcFAZKO1
 8EqcnJA4io4LsNJPyewcV304YWbxmppX2YbmlsiBmg==
X-Google-Smtp-Source: APiQypLfT5TYPQkfXSOnqKIsPG2h/NCohhbOOt/ITEjdT6JDCUeRmXuyKqLoFBxo3s6QwMLMSZP91gkjTLiC3krbssw=
X-Received: by 2002:a9d:490d:: with SMTP id e13mr18228869otf.356.1587573181657; 
 Wed, 22 Apr 2020 09:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200421140840.25729-1-patrice.chotard@st.com>
 <20200421140840.25729-3-patrice.chotard@st.com>
 <CAPnjgZ2h+xuUshDeUCtGQu81oHJ+poproR1B4oXiuS=yFzA-Yw@mail.gmail.com>
 <7f7534e9-5351-c6de-8784-a62d284d6d0b@st.com>
In-Reply-To: <7f7534e9-5351-c6de-8784-a62d284d6d0b@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 22 Apr 2020 10:32:50 -0600
Message-ID: <CAPnjgZ1=DVA_g2Os4Ur2Z4hiJTq7ULBw=x0C-d4GBvnuAyOH2Q@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] cmd: bind: allow to bind driver
	with driver data
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

Hi Patrice,

On Wed, 22 Apr 2020 at 02:13, Patrice CHOTARD <patrice.chotard@st.com> wrote:
>
>
> On 4/21/20 7:36 PM, Simon Glass wrote:
> > Hi Patrice,
> >
> > On Tue, 21 Apr 2020 at 08:09, Patrice Chotard <patrice.chotard@st.com> wrote:
> >> Initial implementation invokes device_bind_with_driver_data()
> >> with driver_data parameter equal to 0.
> >> For driver with driver data, the bind command can't bind
> >> correctly this driver or even worse causes data abort.
> >>
> >> Add find_udevice_id() to parse the driver's of_match list
> >> and return the entry corresponding to the driver compatible string.
> >> This allows to get access to driver_data and to use it as
> >> parameters of device_bind_with_driver_data().
> >>
> >> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> >> Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
> >>
> >> ---
> >>
> >>  cmd/bind.c | 29 ++++++++++++++++++++++++++++-
> >>  1 file changed, 28 insertions(+), 1 deletion(-)
> >>
> > The thing I don't quite get here is why the driver name needs to be
> > specified. If the device tree node is present, and it has a compatible
>
> Sorry, i didn't get your point when you said "why the driver name needs to be specified"

It's just that I don't understand it at all. If the compatible string
is available, why not use lists_bind_fdt()?

>
> Which part of this patch do you made reference to ?

The whole thing, because I just don't understand the bind command.

>
> > string, can't DM find the driver and bind a device automatically?
> >
> > Also, is there any docs for this command? It would be good to add to
>
> Is what in cmd/bind.c not enough ?

I am just confused here. You obviously have a use case in mind, but
the help below is not sufficient to understand what is going on. As I
said, if you have a device-tree node you can find the driver. I am
just not sure what this is for.

It could really use a short document as I said, to explain the uses of
this command and what it does in a bit more detail.

>
>
> U_BOOT_CMD(
>     bind,    4,    0,    do_bind_unbind,
>     "Bind a device to a driver",
>     "<node path> <driver>\n"
>     "bind <class> <index> <driver>\n"
> );
>
> U_BOOT_CMD(
>     unbind,    4,    0,    do_bind_unbind,
>     "Unbind a device from a driver",
>     "<node path>\n"
>     "unbind <class> <index>\n"
>     "unbind <class> <index> <driver>\n"
> );
>
>
> > doc/driver-model and also add a simple test.
>
> Ok i will add an additionnal test to test/py/tests/test_bind.py

OK thanks.

Regards,
SImon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
