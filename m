Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3CA1A1143
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 18:22:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A7C0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 16:22:59 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 097A4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 16:22:56 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48xXkm338gz1s0td
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 18:22:56 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48xXkm2VPfz1qqlD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 18:22:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id KZSWcHckzlau
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 18:22:55 +0200 (CEST)
X-Auth-Info: KHX6pf/L3mdifTKZEYXQeZ61kxvAiDzci+7zEqcggiM=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 18:22:55 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 108)
 id 1236AA08AD; Tue,  7 Apr 2020 18:22:55 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 3DC71A001B;
 Tue,  7 Apr 2020 18:22:51 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 1FB3924003E;
 Tue,  7 Apr 2020 18:22:51 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <60273317e5704581bef81c4beb28ad75@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.3.I8f6df6d28ce5b4b601ced711af3699d95e1576fb@changeid>
 <20200401111859.C78A224003E@gemini.denx.de>
 <60273317e5704581bef81c4beb28ad75@SFHDAG6NODE3.st.com>
Comments: In-reply-to Patrick DELAUNAY <patrick.delaunay@st.com>
 message dated "Tue, 07 Apr 2020 14:31:02 -0000."
Date: Tue, 07 Apr 2020 18:22:51 +0200
Message-Id: <20200407162251.1FB3924003E@gemini.denx.de>
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/16] arm: stm32mp: reset to default
	environment when serial# change
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

Dear Patrick,

In message <60273317e5704581bef81c4beb28ad75@SFHDAG6NODE3.st.com> you wrote:
> 
> > I strongly advice against such a method. Please drop that.
> 
> Understood, I drops this patch....

Thanks.

> I introduce this behavior after a internal request and to avoid issues during tests:
> 
> Some users use the same SD card (same rootfs) on several boards (EV1 and DK2 for example)
> and the U-Boot environment is saved on this SD card. 

OK.

> When an user updates U-Boot binary to use this SD card on other board but not erase the
> environment file (save in ext4 file in bootfs partition), the boot can fail because the
> environment is not compatible between the 2 boards.

Well, why would that fail on another board but not on the one that
is currently in use?  Where is the U-Boot image you are booting
from?   Not on the SDCard, too?

Well, then this is a design problem (or you may even call it a
design bug).  It has always been a bad idea to use a fixed structure
binary format if there are chances that provider (the env storage)
and consumer (U-Boot) may get out of sync.

The binary blob environment format (checksum, eventually redundancy
flag, date with a fixed total size) is inherently only compatible
with other U-Boot versions as long as redundancy and size settings
are kept the same.

If you cannot garantee this, you should use a different storage
format - for example as plain text file.  Of course you pay for
added compatibility across U-Boot configurations with the price of
reduced security (lack of checksum).

But then, normally you do not change redundancy or environment size
between U-Boot versions, so all this should be a theroretical
problem only?


> This patch try to avoid this issue when I detect that the removable device (as SD card) is used on a
> a different board (it is detected when saved serial number with different the OTP).

You see this only as a risk - try to see it as a chance, too.
Imagine a user is trying to copy environment between systems.  Why
would you want to stop him?

Any incompatibility issues can reliably be avoided when using binary
blob format, as then you will get a checksum error, and the
incorrect copy is ignored.

> I make too many assumption on user usage and this patch can't be acceptable in arch 
> (common for all board based on STM32MP15x).

See signature below :-)

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"UNIX was not designed to stop you from doing stupid things,  because
that would also stop you from doing clever things."       - Doug Gwyn
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
