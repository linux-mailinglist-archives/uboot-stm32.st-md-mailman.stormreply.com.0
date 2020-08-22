Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5BD24EA5C
	for <lists+uboot-stm32@lfdr.de>; Sun, 23 Aug 2020 01:19:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24D2BC3FAD3
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Aug 2020 23:19:05 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E4C3C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 23:19:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r15so5149680wrp.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 16:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=ZYiwvUOGYHm1CK2SS8MOOkcQp1DOm+YnaOugc57BYNU=;
 b=SH2psYFWx+eDyEQqwY59xVk74k457DezsJuRI6TYm9DpQRVK3l3xCy6qbUx8F/uoqw
 UPOwUQQ8POQFGiUUmgFlYpDi+asK3rG9oan6BxoBN07rrXISlaIz+d1J/YSTn5hcZPOx
 Fmlf7XPWmcWl5ZP67saATdS1Mo6zMPQ1wCBAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=ZYiwvUOGYHm1CK2SS8MOOkcQp1DOm+YnaOugc57BYNU=;
 b=jN/DGPqhTcECUVb5zIHVho30JcC7vNCuzYK15AilW46rJo3skl1KllLPmKqwCo2nWx
 Kp2LmpFhgAQxwn10XmXfNiAGkpAF1cSAnI1Zy3XwQCkgr7d3e8aYAgScDv0LKRNN9pAw
 KH6ooOkECywemGThnzWGKzJsXeWYKyAJlyue7iYQ4cjqn5G8RuGP8F7XvwI/kepKeNQM
 mPduuR4BpSp2y4Ik2SDEWmqnYQ8vz8WNwROT213bXmeDYwhiDUnjWGb/9MHrk+qdMX5Q
 4+svDXjpZZTfC+7GIy0Sf4rwWrKCLeU4hzkLLx2i2KRIPdDpa1fym0EvR3MjcBu8/zW5
 EAlw==
X-Gm-Message-State: AOAM533xmlJOXNslSa9idmalIvLdwCEAvOreZnwGkFOwwOXvn3JO1kLS
 XtNav6l+Fypyldy3pIcEmgYXQoCFWqykJCUxJPP3yQ==
X-Google-Smtp-Source: ABdhPJwzoXBuz81KEJpUoW4qLX/yd84+ivypvsTckprryCkpdVvy461ccO3x6XOvGoD5AUbemnRxdtywq+SHurqfUfE=
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr8481289wrs.221.1598138342931; 
 Sat, 22 Aug 2020 16:19:02 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 22 Aug 2020 19:18:08 -0400
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <20200728071335.5840-5-patrice.chotard@st.com>
References: <20200728071335.5840-5-patrice.chotard@st.com>
 <20200728071335.5840-1-patrice.chotard@st.com>
Date: Sat, 22 Aug 2020 19:18:08 -0400
X-Google-Sender-Auth: pbxHsU4jmterGbbZxoNL79Ujp5g
Message-ID: <CAPnjgZ1G_tVoMrdhoOtRSAqPMH4FKCtWK+6T6dYVinothvSZ_Q@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Walter Lozano <walter.lozano@collabora.com>
Subject: Re: [Uboot-stm32] [PATCH v5 4/5] test/py: Update test_bind
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

As bind-test is now binded at sandbox startup and no more by
test_bind.py, bind-test nodes are not located at the end of
"dm tree" output, but can be located everywhere in the tree, so
bind-test output could either be:

 simple_bus    0  [   ]   generic_simple_bus    |-- bind-test
 phy           0  [   ]   phy_sandbox           |   |-- bind-test-child1
 simple_bus    1  [   ]   generic_simple_bus    |   `-- bind-test-child2

or:

 simple_bus    5  [   ]   generic_simple_bus    `-- bind-test
 phy           2  [   ]   phy_sandbox               |-- bind-test-child1
 simple_bus    6  [   ]   generic_simple_bus        `-- bind-test-child2

in_tree() function need to be updated to take care of that change.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

(no changes since v3)

Changes in v3:
  - fix typo

 test/py/tests/test_bind.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
