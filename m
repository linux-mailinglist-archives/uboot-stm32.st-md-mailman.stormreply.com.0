Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94612324BB1
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Feb 2021 09:07:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5631BC57B53;
	Thu, 25 Feb 2021 08:07:15 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EFA3C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 08:07:13 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DmQPF1g7kz1qsZn
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 09:07:13 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DmQPF1PjNz1sP6k
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 09:07:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id UQEkuq-dkq9v
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 09:07:12 +0100 (CET)
X-Auth-Info: /YamC/j18jpF/YHzyS76Wt9dUoYg2u3+2dPVVkvhptI=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 09:07:12 +0100 (CET)
Received: by janitor.denx.de (Postfix, from userid 108)
 id 30E8FA01CB; Thu, 25 Feb 2021 09:07:12 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 60B68A003E;
 Thu, 25 Feb 2021 09:07:01 +0100 (CET)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 36060246410;
 Thu, 25 Feb 2021 09:07:01 +0100 (CET)
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <DEE92836-32D1-4113-A3DA-88EF3805968E@gmx.de>
References: <20210224121904.13927-1-xypron.glpk@gmx.de>
 <CAEUhbmV-ie_-G=jASQNDQ26VO78jQXX5D-wQUJPp3psWS67snQ@mail.gmail.com>
 <20210224134257.GJ10169@bill-the-cat> <633221.1614183196@gemini.denx.de>
 <DEE92836-32D1-4113-A3DA-88EF3805968E@gmx.de>
Comments: In-reply-to Heinrich Schuchardt <xypron.glpk@gmx.de>
 message dated "Wed, 24 Feb 2021 17:16:38 +0100."
Date: Thu, 25 Feb 2021 09:07:01 +0100
Message-ID: <649349.1614240421@gemini.denx.de>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Bin Meng <bin.meng@windriver.com>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Tom Rini <trini@konsulko.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>, Weijie Gao <weijie.gao@mediatek.com>,
 Marek Vasut <marek.vasut@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] Correct U-Boot upstream repository
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

Dear Heinrich,

In message <DEE92836-32D1-4113-A3DA-88EF3805968E@gmx.de> you wrote:
>
> If we can have a redirect on the old server, we should be fine.

I wrote:

| We will install redirects to forward HTTP accesses from the old
| repository URLs to the new host.  This should make the transition
| mostly transparent, but does not cover everything.  The following
| needs to be taken care of manually:
| 
| - Update the SSH URI for pushing to the repositories.  Just replace
|   gitlab.denx.de  with  source.denx.de .  We will transfer all the
|   SSH-keys to the new host so nothing else should be needed.
| 
| - Make sure you're logging in on  source.denx.de .  Access to
|   gitlab.denx.de  will no longer work!
| 
| - CI runners connected to  gitlab.denx.de  need to be re-registered
|   with  source.denx.de .

And just to avoid misunderstandings: MTTPS too, of course.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Imagination is more important than knowledge.      -- Albert Einstein
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
