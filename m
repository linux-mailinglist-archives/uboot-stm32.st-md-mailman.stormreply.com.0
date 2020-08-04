Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B681323B289
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 04:00:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 744C2C36B3A
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 02:00:51 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 349B3C36B38
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 02:00:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f7so35906371wrw.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Aug 2020 19:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W5hUEXN0F3gStHPe/G6MIgk3VO3f6aaDe46KKB1XONQ=;
 b=CA7NHm7mJJ9JYm3gcSB0ZHQaaOIeWdQWDvJj1+NmQTF9BuPFPjOIbxdYeo6oBdhz/U
 S9NgEMXZA9ftdkc1VC8nxMPahf4f5mhUCPiPjvzJsFa5TYY/W49eupXG0PwXEva3UrRX
 uXKu7LGOdwzGW4pTQbuIuLrGFY2jzlDswnvQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W5hUEXN0F3gStHPe/G6MIgk3VO3f6aaDe46KKB1XONQ=;
 b=lJPE/zKVfyxTmY+tJt7rZbYDi9iUo/HHmycc7Gl4XIuenu4WybCQF0Pvq+xYBZVWnv
 LGxXJoICrm1vs+Y3FbbV7NIOcNV4RD20FDtdurnuGKIX52zp6eTQLudpUiFSaYXPmyS1
 fhSeAyi3IRfzWW7FoT+i2yFi6lwIAhzT97yeLpy38N04CnZyu/AowjEL5XPERbU6tYqx
 skl0nX7BD90E4Gx02nvtm8VYREiw1U/eQYGyD9Kv34rTGa1FhGn+oxU3hMEPZ64+ElbT
 c0pf/FH2e+3dP3FEfwG4v8LR8bDKCT/8z/bwXF7HFtV5A/FkfepWBaYz3Pg+ZfJvALy/
 rF5A==
X-Gm-Message-State: AOAM530lGWlAolxyyWlPaHgN1koiG1EM/7obFl9AR9fQhbR6g2FO+Fk2
 Hf4E/lUmWTXjmJAQzjqFDl13E3r27cFUnyX7HeCqgg==
X-Google-Smtp-Source: ABdhPJyZIomgdMPkjrm5En2m/qBKbKkT1OSQXD2v4OrZ2ysTrMVntQexHL0gMZMNzSy4LeeZBXwLRj/aUXkRNfnu8os=
X-Received: by 2002:adf:a488:: with SMTP id g8mr17052253wrb.221.1596506447711; 
 Mon, 03 Aug 2020 19:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200728071335.5840-1-patrice.chotard@st.com>
 <20200728071335.5840-6-patrice.chotard@st.com>
In-Reply-To: <20200728071335.5840-6-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 3 Aug 2020 20:00:32 -0600
Message-ID: <CAPnjgZ0owXvzrxbk_uHusCCEmNrWrUhJnSof8Hz9bxE2k8eb-Q@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v5 5/5] doc: add bind/unbind command
	documentation
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

On Tue, 28 Jul 2020 at 01:13, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Add documentation in doc/drivel-model for the bind/unbind command.
> Part of this documentation is extracted from original patch commit
> message:
> commit 49c752c93a78 ("cmd: Add bind/unbind commands to bind a device to a driver from the command line")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>
> ---
>
> (no changes since v4)
>
> Changes in v4:
>   - fix make htmldocs error "Title underline too short"
>
> Changes in v3:
>   - fix typo
>   - add bind/unbind parameters description and how to find them
>
>  doc/driver-model/bind.rst  | 49 ++++++++++++++++++++++++++++++++++++++
>  doc/driver-model/index.rst |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 doc/driver-model/bind.rst

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
