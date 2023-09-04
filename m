Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B579221F
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Sep 2023 13:29:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33C31C6B454;
	Tue,  5 Sep 2023 11:29:49 +0000 (UTC)
Received: from mx1.tinet.cat (mx1.tinet.org [195.77.216.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BE92C6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 12:48:39 +0000 (UTC)
X-ASG-Debug-ID: 1693831717-163e7b47e046ee50001-idqh3N
Received: from smtp01.tinet.cat (smtp01.tinet.org [195.77.216.131]) by
 mx1.tinet.cat with ESMTP id Kv5cbQ4KDN97gTlc;
 Mon, 04 Sep 2023 14:48:37 +0200 (CEST)
X-Barracuda-Envelope-From: xdrudis@tinet.cat
X-Barracuda-Effective-Source-IP: smtp01.tinet.org[195.77.216.131]
X-Barracuda-Apparent-Source-IP: 195.77.216.131
Received: from xdrudis.tinet.cat (42.red-79-152-186.dynamicip.rima-tde.net
 [79.152.186.42])
 by smtp01.tinet.cat (Postfix) with ESMTPSA id 948FD605D080;
 Mon,  4 Sep 2023 14:48:37 +0200 (CEST)
Date: Mon, 4 Sep 2023 14:48:26 +0200
From: Xavier Drudis Ferran <xdrudis@tinet.cat>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZPXSGkf+vdXlIbVq@xdrudis.tinet.cat>
X-ASG-Orig-Subj: Re: [PATCH] usb: host: ohci-generic: Make usage of clock/reset
 bulk() API
References: <20230830080150.473374-1-fabrice.gasnier@foss.st.com>
 <ZPL7DAQfE3WxCFa+@xdrudis.tinet.cat>
 <428ea549-1092-fb39-15e1-10f2284691e8@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <428ea549-1092-fb39-15e1-10f2284691e8@foss.st.com>
X-Barracuda-Connect: smtp01.tinet.org[195.77.216.131]
X-Barracuda-Start-Time: 1693831717
X-Barracuda-URL: https://webmail.tinet.cat:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at tinet.cat
X-Barracuda-Scan-Msg-Size: 4602
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.8822 1.0000 3.0378
X-Barracuda-Spam-Score: 3.64
X-Barracuda-Spam-Status: No, SCORE=3.64 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=6.0 KILL_LEVEL=8.0 tests=MARKETING_SUBJECT
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.113652
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.60 MARKETING_SUBJECT      Subject contains popular marketing words
X-Mailman-Approved-At: Tue, 05 Sep 2023 11:29:47 +0000
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xavier Drudis Ferran <xdrudis@tinet.cat>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: host: ohci-generic: Make usage of
 clock/reset bulk() API
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

El Mon, Sep 04, 2023 at 11:25:06AM +0200, Fabrice Gasnier deia:
> 
> IMHO, the OHCI should have failed too in this example, instead of
> silently ignoring the error. Hopefully it has probed.
>
> The clk_get_bulk() code does a similar job compared to ohci current
> code. It counts all clock entries. So, when trying to get them, these
> should be found.
> 
> Having a clock listed, but it can't be found or taken rather looks like
> a real error, that needs to be fixed.
> (e.g. missing config for a clk/reset controller ? Or could it be a bug
> in such a driver ? Or a miss-configured device-tree ? something else?)
> Ignoring such error may be miss-leading (as you pointed out, one was
> working).
> 
> I hope I don't miss your point. If this is the case, could you point
> more precise example, or how it used to fail ?
>

No, you don't miss my point. I'll give you pointers to the case I
meant, but I'm afraid it might mislead, because it's already solved,
and for current U-Boot it should pose no problem with or without your
patch.

The general problem might be that dts come from linux, and the drivers
come from U-Boot, so U-Boot might ignore some hardware described in
the linux dts that it doesn't need. Now this is more typical for, say,
a VPU than a clock or reset. But it once was a missing clock driver in
U-Boot that linux used for suspend/resume and happened to be at the
end of the clock list. So it worked when ohci probe ignored the missing
clock, because U-Boot doesn't need suspend, but it didn't work for ehci
that called clk_get_bulk().

There might be other cases like that example somewhere, but I'm not
saying it's likely. I guess we'll know if some board breaks.


If you really want the gory details...

https://patchwork.ozlabs.org/project/uboot/patch/20220701185959.GC1700@begut/
https://patchwork.ozlabs.org/project/uboot/patch/Y44+ayJfUlI08ptM@localhost/
https://patchwork.ozlabs.org/project/uboot/patch/Y5IWpjYLB4aXMy9o@localhost/
https://lists.denx.de/pipermail/u-boot/2022-December/501811.html
https://lists.denx.de/pipermail/u-boot/2023-February/510676.html
https://lists.denx.de/pipermail/u-boot/2023-February/510678.html
https://patchwork.ozlabs.org/project/uboot/patch/202013db5a47ecbac4a53c360ed1ca91ca663996.1685974993.git.xdrudis@tinet.cat/
https://patchwork.ozlabs.org/project/uboot/patch/464111fca83008503022e8ada5305e69ffd1afbd.1685974993.git.xdrudis@tinet.cat/


> > In that case, a fix by ignoring the missing clock
> > in ehci was rejected, so maybe that criteria applies here as well and
> > your patch is deemed correct. I don't know. That case won't break now,
> > I think, either with or without your patch, because after another fix,
> > that clock will be found.
> 
> If I understand correctly, this used to fixed elsewhere (e.g. there used
> to be a real bug fixed) ?
>

Yes. See above. Or don't, it's not that important.
A clock driver was missing, only needed for suspend/resume.
ohci ignored it and worked (U-Boot doesn't suspend)
ehci failed probing and dind't work.
Current situation is this particular clock driver is no longer missing.

> > But I don't know if there might be similar
> > cases.
> > 
> > I just wanted to point out the change in behaviour. If the change is
> > intended, then all is fine.
> 
> IMHO, this should be fine. I hope you agree with this change and the
> rationale.
>

I do.

I just wanted to point it out in case anyone knew why ohci wasn't
calling clk_get_bulk(). It might have been on purpose.

In fact Kever Yang once proposed to change ehci to be tolerant to a
missing clock like ohci was (but with an explicit warning). But Marek
Vasut proposed adding a clock driver and Kever didn't complain, so I
don't think this is his very strong opinion, he may just be happy when
things work and others are happy, I can't read minds.

https://lists.denx.de/pipermail/u-boot/2022-December/501811.html

FWIW

ohci_probe introduced:
fee331f66c9 (Alexey Brodkin   2015-12-14 17:18:50 +0300 

loop for clocks introduced in ohci_probe:
155d9f65d3b (Patrice Chotard  2017-07-18 11:57:12 +0200 

clk_get_bulk introduced:
a855be87da4 (Neil Armstrong      2018-04-03 11:44:18 +0200 156)

So ochi_probe() didn't call clk_get_bulk() most likely because it
din't exist back then.

So, unless someone else has a failing case, I agree to your change.

I'd welcome if the commit message would say that the new policy is any
missing clocks or resets cause the probe to fail. But since you
already sent v2, it doesn't matter.

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
