Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB8A1A1154
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 18:28:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAA17C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 16:28:55 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4B42C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 16:28:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48xXsf3qglz1rs04
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 18:28:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48xXsf3kxQz1qql9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 18:28:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id rTzzcdA-gZ1W
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 18:28:53 +0200 (CEST)
X-Auth-Info: jnVtClN6QegRMtaGdpvOK0kpax2NfTqURBza8wESHlI=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 18:28:53 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 108)
 id 80B0AA0A28; Tue,  7 Apr 2020 18:28:53 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id DB637A08AD;
 Tue,  7 Apr 2020 18:28:47 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 8884D24003E;
 Tue,  7 Apr 2020 18:28:47 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <8607d1778bcd4035807908e4a3a90381@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331160456.26254-1-patrick.delaunay@st.com>
 <20200401112615.931A024003E@gemini.denx.de>
 <8607d1778bcd4035807908e4a3a90381@SFHDAG6NODE3.st.com>
Comments: In-reply-to Patrick DELAUNAY <patrick.delaunay@st.com>
 message dated "Tue, 07 Apr 2020 14:54:31 -0000."
Date: Tue, 07 Apr 2020 18:28:47 +0200
Message-Id: <20200407162847.8884D24003E@gemini.denx.de>
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 04/16] arm: stm32mp: detect U-Boot version
	used to save environment
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

In message <8607d1778bcd4035807908e4a3a90381@SFHDAG6NODE3.st.com> you wrote:
> 
> To simplify the test:
> 
> env_check = " if env info -p -d -q; then env save; fi;"

All such automatical "env save" actions somewhere in the code give
me the creeps.  I've seen too often that they did things I nver
intended to do or would have accepted if I had a chance to decide.

Use extremely careful, please.

From a user point of view, it's me who owns the environment, and
nobody should mess with my data without me confirming it.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"Well I don't see why I have to make one man  miserable  when  I  can
make so many men happy."              - Ellyn Mustard, about marriage
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
