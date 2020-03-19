Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D8318AEF8
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 10:13:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE51C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 09:13:41 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D4C3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 09:13:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48jh6D0Pz3z1rfLn
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:13:40 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48jh6D0048z1qrG1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:13:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id beSexziHWsi8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:13:39 +0100 (CET)
X-Auth-Info: EN0y9gOlhHpzk+JRCx2zwruzGUzb6qro2LMDdjLaa9w=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:13:39 +0100 (CET)
Received: by janitor.denx.de (Postfix, from userid 119)
 id D8CD1A2C3F; Thu, 19 Mar 2020 10:13:38 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 228EBA2B88;
 Thu, 19 Mar 2020 10:13:37 +0100 (CET)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id CFD5E24003E;
 Thu, 19 Mar 2020 10:13:36 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <07159b22a76a445089aa6cd646c0ef1c@SFHDAG6NODE3.st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-8-patrick.delaunay@st.com>
 <20200318104452.3B6E824003E@gemini.denx.de>
 <07159b22a76a445089aa6cd646c0ef1c@SFHDAG6NODE3.st.com>
Comments: In-reply-to Patrick DELAUNAY <patrick.delaunay@st.com>
 message dated "Thu, 19 Mar 2020 08:57:58 +0000."
Date: Thu, 19 Mar 2020 10:13:36 +0100
Message-Id: <20200319091336.CFD5E24003E@gemini.denx.de>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 07/10] board: stm32mp1: add finished good
	in board identifier OTP
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

In message <07159b22a76a445089aa6cd646c0ef1c@SFHDAG6NODE3.st.com> you wrote:
>
> > I can't parse the sentence above, sorry.
> 
> It is a part of the codification used in production of ST board, sorry if it is not clear.

I see.

Please add suich explanation to the commit message and maybe even
comment in the code.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Everyone, in some small sacred sanctuary of the self, is nuts.
                                                         - Leo Rosten
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
