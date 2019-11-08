Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BABF5044
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 16:54:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 746B9C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 15:54:55 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC5F3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 15:54:54 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id g3so6709751ljl.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Nov 2019 07:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NTRaZ4nxSZJBqgIHARl1fPmznQ4Bs3AJoYXV2FsinkI=;
 b=eL0/M27iWu2NKvMHqn7VU+sNJTFhnjkuuc2DzIRcSy8sgNUsKoan1k8wKn/qnXUtEz
 Ou192qiA6jsxcUjD2aqhEWoZX+q5UGjCLPJiGSO387UfppPzLEaXpYAOgFXevT93r3uz
 L/wpIYvheTPnlvtpzvOxfjqeJqSziaBZ1/irLLQi6cidUDgpye8W9PdreZ7JrC9JUyqv
 0MgXTB/YgrsgPEwHkUxiL+zemoYVq/k0w2M93R2L4AOaVTt3dYnQGad7o+hWxn3URu1N
 Tc6cP9WPqmqvTK0Muq/GTegQhCjeslKSooRw5R3UDYdLqjj4DYEDqQrg4PovqeGFQMUj
 aZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NTRaZ4nxSZJBqgIHARl1fPmznQ4Bs3AJoYXV2FsinkI=;
 b=hfkzyWHX+ZB4Uf0mCGLumYB2oWpjK0/8puzW7tL3PAPtORKUvQaRDg8UNyeV8xZs3E
 oQ2t2b1V7P9pgdU28GcTk4wwzsBVo18+UlBYKflOvJ2f0OoTcu216UUNqKAIKZoJivKi
 3sTayN7hivHZPWKjBKfQlrK2oMpPdMSbtst6ScX4pcdYsyuz+qj+RAVy4hu21uxrv9ut
 sK1G4Wog3BJUY9ut8FR8MmIjIShwQddgfkZSQzxrVV24gk/x7kreoVmGoIAL9p5v4Azq
 xU+k2q7mI8z02O0JvHrnCHVzkZf2AidX12Pk/JkY6B3XOppgwoZkY5nCsPhAGx4ouvWJ
 cElQ==
X-Gm-Message-State: APjAAAUwZHjaf/oZ10d1bzLr/5vreEbujFeJBsHU/xq3r85tnb+6xwFk
 GPaETGG1eRotJPIgTqiFJT3RVl2zLY7OdYl1oAg=
X-Google-Smtp-Source: APXvYqwLrbVoDLAPIAFJNfOlHQcTy44cCMkggMPdwwk7qITzM3EpFOZE+CcjbmbGQOUAUO820IMrdsXnTPkNu6fHseE=
X-Received: by 2002:a05:651c:238:: with SMTP id
 z24mr7090659ljn.36.1573228494133; 
 Fri, 08 Nov 2019 07:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20191108144716.23829-1-patrick.delaunay@st.com>
 <507210dc-a047-8f33-873c-fb336e1f8ba0@denx.de>
In-Reply-To: <507210dc-a047-8f33-873c-fb336e1f8ba0@denx.de>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Date: Fri, 8 Nov 2019 16:54:24 +0100
Message-ID: <CAAh8qsySU816FAqcjmvqsu_Rx6Yy-pk7yHHLsqkMhhrqsFPBzA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Bin Meng <bmeng.cn@gmail.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 b.galvani@gmail.com, U-Boot Mailing List <u-boot@lists.denx.de>, "Tan,
 Ley Foon" <ley.foon.tan@intel.com>, Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v2 0/4] usb: host: dwc2: use driver model
	for PHY and CLOCK
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
Content-Type: multipart/mixed; boundary="===============5731269433700961284=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============5731269433700961284==
Content-Type: multipart/alternative; boundary="0000000000008b1f090596d7cd6f"

--0000000000008b1f090596d7cd6f
Content-Type: text/plain; charset="UTF-8"

Marek Vasut <marex@denx.de> schrieb am Fr., 8. Nov. 2019, 16:46:

> On 11/8/19 3:47 PM, Patrick Delaunay wrote:
> >
> > In this serie I update the DWC2 host driver to use the device tree
> > information and the associated PHY and CLOCK drivers when they are
> > available.
>
> I'm kinda on the fence whether to add it into current release or not.
> The patches look generally OK to me.
>
> Ley, Simon, can you check this on SoCFPGA ?
>

Gmm, so can try, but I don't have a working setup with USB peripherals
attached... I do have USB on the socrates, but currently no cable to
connect anything...

I could test it to see if I can get the same result saying no attached
devices are found, that would mean probing still works correctly...

Regards,
Simon

Bin, can you give it a once-over ?
>
> If this looks OK to you, I will add it.
>
> [...]
>

--0000000000008b1f090596d7cd6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex=
@denx.de</a>&gt; schrieb am Fr., 8. Nov. 2019, 16:46:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On 11/8/19 3:47 PM, Patrick Delaunay wrote:<br>
&gt; <br>
&gt; In this serie I update the DWC2 host driver to use the device tree<br>
&gt; information and the associated PHY and CLOCK drivers when they are<br>
&gt; available.<br>
<br>
I&#39;m kinda on the fence whether to add it into current release or not.<b=
r>
The patches look generally OK to me.<br>
<br>
Ley, Simon, can you check this on SoCFPGA ?<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Gmm, so can try, but I don&#39;t=
 have a working setup with USB peripherals attached... I do have USB on the=
 socrates, but currently no cable to connect anything...</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I could test it to see if I can get the sa=
me result saying no attached devices are found, that would mean probing sti=
ll works correctly...</div><div dir=3D"auto"><br></div><div dir=3D"auto">Re=
gards,</div><div dir=3D"auto">Simon</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Bin, can you give it a once-over ?<br>
<br>
If this looks OK to you, I will add it.<br>
<br>
[...]<br>
</blockquote></div></div></div>

--0000000000008b1f090596d7cd6f--

--===============5731269433700961284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5731269433700961284==--
