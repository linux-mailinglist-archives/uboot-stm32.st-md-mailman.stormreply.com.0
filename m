Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC971279D65
	for <lists+uboot-stm32@lfdr.de>; Sun, 27 Sep 2020 03:59:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5F61C36B25;
	Sun, 27 Sep 2020 01:59:45 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43312C36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Sep 2020 01:59:42 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id e11so2006310wme.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Sep 2020 18:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=8vnUR/U6x2CCWgGe67zjEEYUrBlR4DS7Gc3Jb6n1GLI=;
 b=F5ioElJqEDEZDTTLx75ikpPVmqE/O8MJWWg9JsMoZ2GUp2yezoLDlaj6eUNtJk7xin
 hxyVTxPsSfATt7gG4e7cyfYceE+tbS65KrKR6ctlxbxVKtnkDzQ4dbcxp3s4BZQkvgpr
 5pH9NpEpewm//ChHkOsb2gyBjNKOL0kGrmgLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=8vnUR/U6x2CCWgGe67zjEEYUrBlR4DS7Gc3Jb6n1GLI=;
 b=hR5iecFWHyWhlOhfMUIOuQb8/dENiDuRu4NS2LSb0D7Z0a9347jOYJsjoWdLwYHnLg
 s6D4ZP8HkCIpowG4udCAcy2qAheHd6uKAaPEKznZM9K/tjv0S7Q4p/9cJGLiOX25phKN
 bt7ve9/yk3X/V4rTE1HvycFXLrs//KHKr/b7zpn6TdIDRLORcqVv++9yCD1V9QFDBm9Q
 an241x4F3ra6wDSmGtN9Y2R1J+sOYMAQOJIm4D54M8z65rQ5QtNtnJ09JEDDqcTP5CCQ
 GYKMYg8bXSY/gehz9sRyvKNjFelCePL485B1DqrK5UXvbp2YTKFnzjBcMf8XHniajwzY
 Jt/Q==
X-Gm-Message-State: AOAM531Ka+9GjiewZpmq5ga45UlSn7lvnJh35FTOqweh9cHCC+rtNje1
 eB7nRyVmghIN8gLLbxmi/bxy2rQQ3mcbGMfulKlp1g==
X-Google-Smtp-Source: ABdhPJwUWAdANdx+teNEn3JbHYVMSgFWUxIH0BiTvJbty2mYFQXZwA+vI5yNPnVdVx1UoA2anOt1XykcrHhjX2O4w/Q=
X-Received: by 2002:a1c:b703:: with SMTP id h3mr4683913wmf.131.1601171981618; 
 Sat, 26 Sep 2020 18:59:41 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 26 Sep 2020 18:59:36 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <20200910085004.12883-1-patrice.chotard@st.com>
References: <20200910085004.12883-1-patrice.chotard@st.com>
 <20200910104956.v4.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
Date: Sat, 26 Sep 2020 18:59:36 -0700
X-Google-Sender-Auth: 5ZnLN9Nh6OCqs4HDhCPfd3liEUo
Message-ID: <CAPnjgZ1kpQVLDKWh587tOT7nHp7-TC+UY_EVEmjYJn4a8QvDew@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v4 2/3] test: fdtdec: Add test for new
 no-map fdtdec_add_reserved_memory() parameter
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

Add a test to verify that the no-map property is added in reserved-memory
node when fdtdec_add_reserved_memory() no-map parameter is set to true.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

(no changes since v2)

Changes in v2:
   - Add no-map property test into fdtdec test

 test/dm/fdtdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
