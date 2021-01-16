Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8A92F8C5F
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 10:05:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46FECC57183;
	Sat, 16 Jan 2021 09:05:54 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05130C5717E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 09:05:51 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id y4so7476301ybn.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 01:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5ZGotAEt9IvwLNsmY9FrZZF5pT4bINZwa0R3IzH04o=;
 b=oGxe2GMic1l/PcWlTFdcMXD12+79LO9PftOIomGb5eUILGI3qYdZUWgNHh5kMZmkqh
 rMXNwMAVkiOZNp/YfXRPW9n1pZ+lhfaxXkyljYSYy9Old6tyz+fCoSuPhtkWZ9rpm1VS
 Pj8lVFly/x8FQRaL0rRJs+4Ulj8FJZ9omEE74frozz2sr6X0R2wczrVdFc+FRfj2Wmy4
 ZQsOS0uVdoks4B26tA8HQQv5SugDILkZ0p7B4pIorciikdnfZMkNmTaO3+VD1TycOrq6
 buMsMmCFXUlkQEQj1qa0h2hdyLSTmOelLnv0N2sM4aHWtQngMJtQ8YxXb6Vq5SQdnDA5
 r85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5ZGotAEt9IvwLNsmY9FrZZF5pT4bINZwa0R3IzH04o=;
 b=IKzA/OJuXRB+7G+qQQ51POA/WDkOdqHtrHd+y4ahNZJw+hbmkxMHq9w1nVw/fiTV1+
 wnx6olyG6+ifHT80MLAIRmNgQBGnd3iUpAtTP+FT5vn+hfgpN8TnihWBgFjP4XbS3Iy5
 Cmc+S3O+0nioU8DgdLdnYe0ttTUsy3Th74TSJlVd1NEEDaCLDMlAmM+/PCh5hl9pstdW
 KhiDt0jv1cZdSdlPZpql7ZgMouAVSeMN3It4llTplU3SwqEyKFh5R5u38n1DWhZ1kWwK
 qDAG6YnxuPpzRVxHlGgtR0O3RdN3/kCFXCeN6AsbtxvvcGqfwLgD97S082FAR3Noh4Eu
 Mk+A==
X-Gm-Message-State: AOAM530u+rHS92nDakyiAzJ1Vx22zcB9j3r4nqxqO649B3obNaOFvv2S
 bsPbFfMDqAx1DC1E4N2P5i99sed1R1RVaxb00Ck=
X-Google-Smtp-Source: ABdhPJy3usmpLsDjHIw4W6Uww1uA9GHa7rMPnU7tXFlwVE/YCzSbTHilI3v8Y7N4umu62QvRpFrReDONSJrj1OpvTtk=
X-Received: by 2002:a25:2041:: with SMTP id g62mr24796403ybg.152.1610787950424; 
 Sat, 16 Jan 2021 01:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20210114120355.1.I3bbd596e6af847434c65a45cd845fe58e55bdbc5@changeid>
In-Reply-To: <20210114120355.1.I3bbd596e6af847434c65a45cd845fe58e55bdbc5@changeid>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 16 Jan 2021 17:05:15 +0800
Message-ID: <CAEUhbmX81Mm=CF82cftkDtjtjB-EgXj4gYy8b3fnRF8fX3diNQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH] doc: update help message
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

On Thu, Jan 14, 2021 at 7:04 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Update the help message used for 'make help':
>
>   Documentation targets:
>     Linux kernel internal documentation in different formats from ReST:
> =>
>     U-Boot documentation in different formats from ReST:
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  doc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
