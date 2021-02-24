Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F09F13241AF
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 17:17:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF1D5C57B58;
	Wed, 24 Feb 2021 16:17:07 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 808D3C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614183404;
 bh=2htUeZGa0BBnqyVhMBajSboFFZBZz0/E1gv+xm37/l8=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:To:CC:From;
 b=DBv1eQ6yQCZwdPcPU/BOAUmlnxLN9mPMeirfuwJ+46+euv5banV8ilhIgwtltdDJS
 OGzDRtXBOA9ifag79ltXuvl8zRp876ELAyMVi4O8ktmPfqY1HxxlCxv/ZWgJCryDPu
 65ik9gxwfs7KmFDZdfpRkP2k4BVHWRUl9tm8iVlw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from android-8ab098a1be3e92ba.fritz.box ([62.143.246.89]) by
 mail.gmx.net (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M3DJv-1lGJkX0i1V-003e60; Wed, 24 Feb 2021 17:16:44 +0100
Date: Wed, 24 Feb 2021 17:16:38 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <633221.1614183196@gemini.denx.de>
References: <20210224121904.13927-1-xypron.glpk@gmx.de>
 <CAEUhbmV-ie_-G=jASQNDQ26VO78jQXX5D-wQUJPp3psWS67snQ@mail.gmail.com>
 <20210224134257.GJ10169@bill-the-cat> <633221.1614183196@gemini.denx.de>
MIME-Version: 1.0
To: Wolfgang Denk <wd@denx.de>,Tom Rini <trini@konsulko.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <DEE92836-32D1-4113-A3DA-88EF3805968E@gmx.de>
X-Provags-ID: V03:K1:u87cj8dazoTyy+VhFlbv7Q8mO929unnsFAiPiN9UPTUdqLuZR1I
 cK6hfCnYEbt2LhI1Ueye3I6rmxjWlMNFdjUvmeh4LfwUTACGM9unAV+8QrIenTQnEoO8Idp
 I6I7dfk3fYwBvDELrUJweDqU5MNI/Oi++YH7bIJ9fIHOKDy9RG6jIomqAg/Vq/yOAAqwcNn
 ko0fihyXOCUaW+1sRf+Gw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HichM5yTDR4=:xJZxTZ7qsJu/k7sw1wn/Pa
 Ah3TBIqZIyIVAS5+oq4KT2hDISBzLwxd5c845I+o5VW6ARFlmuLtT3HH3k2tbNrAh9khRZ7Ir
 YlVCsl856tdr3iYm/KY8a2s82wtv4FPqkQxS2C+1czJ9Kh85AwGNKnZWFCeyslgdtOgkNPohR
 5aSaYupe2Gq+ONaLSALFcVpkN5p0SBlCNfpZ3hRqEnUrv5L4Okj+gOdcFJukfvG8F/aTetVSd
 CdftTuU8M8B7zLoitJziJutmCu4EJhTbXCG+SMn6OWNeZE68zRFq97Gtsg//NC9HXBep+Bk/U
 WfZFBcyk97dmllxqzhQNMH42HIV6ZC8VZKK1Y296thLJqr9YgOxikyHwFgCkfJXLg5yuKF0wS
 iYaxX1+srolzrVYQtTrRwZyDq82hkkvfSqZHH6R21uGSP5sU0ahJ1t3U2e3Ok9onDPvh8te+n
 Orbl8eCwQyqIVePnfpWSeO4XyRKLAw63K8xLPfwB8IN2sZXjHw5LYo5rvYvJwjoudpAywlutm
 zisb91gUPgEbojvOkuyv2G23cW2W6hWQZc88vYJCSki6s52XTmTnH3zeh/XnxyeEHGSalDZEz
 Mlq4WjtOGDRH40tZ2Tm2fj/VmFQxrDOAFEE57H/YVCaYp7PUg+onV6642dunVAXvU68ULE4fG
 PuCdgLMTDHt/qdL/9MaKEu6XcrF5tyTy8Dwj5MC8hu790jdfUpMmlb6L2cl4BnUaDtYcYBIpx
 JmSfTZWDW4D4T1QNMbdeVuJBA4sZ7q43BYeZahgqR1I+X51NZrx85IeLTXSfL+nF9UwFol5k4
 oC4Ocv/OHch4H01oOYHl/coZm5RFvLKhhwGnN5S1dCQeoziSkQLS30EG1w7fUkdVSs7pqwFCg
 nb1UFWxzJGFRsvW5msRw==
Cc: Michal Simek <monstr@monstr.eu>, Robert Marko <robert.marko@sartura.hr>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bin.meng@windriver.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Stefan Roese <sr@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 Marek Vasut <marek.vasut@gmail.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Adam Ford <aford173@gmail.com>
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

Am 24. Februar 2021 17:13:16 MEZ schrieb Wolfgang Denk <wd@denx.de>:
>Dear Tom,
>
>In message <20210224134257.GJ10169@bill-the-cat> you wrote:
>> 
>> > Where is this information posted?
>>
>> https://lists.denx.de/pipermail/u-boot/2021-February/442175.html
>>
>> Which yes, we need to figure out how to get more widely seen most
>> likely.
>
>Well, I posted it on the U-Boot list, and on the Custodian and Board
>Mainteiner lists, too (plus on the Xenomai list).
>
>I also update the link on the web page.
>
>What else can be done?  If people don't even read messages flagged
>as important ?

If we can have a redirect on the old server, we should be fine.

Best regards

Heinrich


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
