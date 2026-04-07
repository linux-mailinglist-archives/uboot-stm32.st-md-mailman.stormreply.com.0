Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL0YNv9f1WkF5gcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 07 Apr 2026 21:50:23 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 791BF3B406D
	for <lists+uboot-stm32@lfdr.de>; Tue, 07 Apr 2026 21:50:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D30ECC8F280;
	Tue,  7 Apr 2026 19:50:22 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB47BC3F945
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2026 19:50:21 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-7d4be94eeacso5701532a34.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Apr 2026 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1775591420; x=1776196220;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TU9aHqQN9gp/ACGep7Y7VIJ+H+/wIZZzez+PUyLK1gg=;
 b=Pvou6LGguBpPD1NV0unc3sUal4jxymaI4OxO5qPIrGzScFfp8er6KEJ7eT8Z6jUPB0
 KT4R6mK4HvAZiJeTz9jDS8Ib+vg+cs2yuUwChYuJ645dGF61A7OqbhOMlrSywT44dmM/
 w3wFPZZMfr3AG4T9SToUgSiccqQb+HKvDIGKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591420; x=1776196220;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TU9aHqQN9gp/ACGep7Y7VIJ+H+/wIZZzez+PUyLK1gg=;
 b=cja//KMK3BcqUzHSIaHOZPUXWJ4za2OknYSYnlNgBraDE6JMsC5srBHctl6wi1FXZ8
 uC3cRzAxmt4olg4ADNETPq/kfjfUvyhVd97eiCYMeNP5r24GMqh1KJofkRpDu2UkClsG
 vt0wDBg0VrUKUVUg43oRyeNeEPx/HM9Q58Rhcze+Hluy5nngZXadiRPH0j0GsFIrYHH8
 SpqBksxbMMBsANm93Ol3hmaCV39g/CgkbUqhIU0WLNKrALh51W/iuf3DALfROALfXQdN
 2aKLJFcGlmqrvuGtLK4lVcbOPtPliqtbDmNxMGe6sUpCFgAf+1IwqIdQVEToIBejflj6
 u/xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyynXcwqmCpqaPNOoLaiK33cyD21lLnkXDTMPrPvIVA3B8f7hVfiLnZFiF324sNw9d2Do/pkuURVs/9Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGKvvpjs3wAFazcc7rmdqe7DD4Hf6WAKi4CHqCdVZ6AhsK4Y5s
 +Bzz9xdRyzlvLchRxV+9A7SzCEBXHbwkpVHeNCNbBGlng64Fd4SYJZuHlIQ6Esr3KM4=
X-Gm-Gg: AeBDieugD+YcRqSTCH5Ls1k4Yyi1OqKMlzM6C2T+z3hYqOmhztfQW8ku+Gx1Owk3/ea
 6LXOp42NbiBx0cHfaiPdlXzfE+q4RBR3lXLzuC7pLEK0+/XfQNSTbENZC6khWxWFOkdJJ1bLp8x
 KN5TJGOJhy6RFO0dgI4LPoaf2Q7QxnYBYz+jY/9DmBsL9UUQuW9HweHwse3sob/um/mlmAYNLAp
 C81n4AjIZ0jvcttmDRHj0qp0fgxPkC39FYU0hhbuang3HEukF1JXJOplP4qknOvDtWBzXz7Dgis
 RFtFJC9Hb0vglVJRcBwynv2N7rSFYni+ZsvQSkb6u5a42IT+Nl5FSECIMNm/C4XgD2Cf/OAtsUS
 u+xfQFR+JYgvuGYAiSw5A58orf0ju5mTxtqv7+F6dWzJa1d0QmrLtvK8y6LyPlwVSDsbRpzvp2S
 1DNwki5SxCvkd8xvSKzaJbErgYKGegC7UxVH6WRO6VSBdgZOQKLfIENhW2hTg72LWsEpPg7KXWi
 H1g7lh16ULhqxZmMr8hj2U47tnv3TwFEU+rRozFqVdlrk8=
X-Received: by 2002:a05:6820:81c4:b0:67d:e836:2e46 with SMTP id
 006d021491bc7-6822064327emr10582368eaf.45.1775591420434; 
 Tue, 07 Apr 2026 12:50:20 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-97-235.totalplay.net.
 [189.203.97.235]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42324017960sm9988782fac.7.2026.04.07.12.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:50:20 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>
In-Reply-To: <20260323225537.896180-1-trini@konsulko.com>
References: <20260323225537.896180-1-trini@konsulko.com>
Message-Id: <177559141859.2108693.17265258152616779822.b4-ty@konsulko.com>
Date: Tue, 07 Apr 2026 13:50:18 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.3
Cc: Peng Fan <peng.fan@nxp.com>, Casey Connolly <casey.connolly@linaro.org>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot-qcom@groups.io,
 Jerome Forissier <jerome.forissier@arm.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 =?utf-8?q?=C5=81ukasz_Majewski?= <lukma@nabladev.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, linux@analog.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] global: Correct duplicate U_BOOT_DRIVER
	entry names
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[konsulko.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[konsulko.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:peng.fan@nxp.com,m:casey.connolly@linaro.org,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:kojima.masahisa@socionext.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot-qcom@groups.io,m:jerome.forissier@arm.com,m:simon.k.r.goldschmidt@gmail.com,m:u-boot-amlogic@groups.io,m:jh80.chung@samsung.com,m:pbrobinson@gmail.com,m:treding@nvidia.com,m:marek.vasut+renesas@mailbox.org,m:tien.fong.chee@altera.com,m:lukma@nabladev.com,m:philipp.tomsich@vrull.eu,m:hs@nabladev.com,m:neil.armstrong@linaro.org,m:mbrugger@suse.com,m:sjg@chromium.org,m:clamor95@gmail.com,m:linux@analog.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:ag.dev.uboot@gmail.com,m:simonkrgoldschmidt@gmail.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,linaro.org,mailbox.org,rock-chips.com,socionext.com,st-md-mailman.stormreply.com,groups.io,arm.com,gmail.com,samsung.com,nvidia.com,altera.com,nabladev.com,vrull.eu,suse.com,chromium.org,analog.com,foss.st.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[konsulko.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.800];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,konsulko.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 791BF3B406D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 23 Mar 2026 16:55:37 -0600, Tom Rini wrote:

> The U_BOOT_DRIVER macro creates a list of drivers used at link time, and
> all entries here must be unique. This in turn means that all entries in
> the code should also be unique in order to not lead to build failures
> later with unexpected build combinations. Typically, the problem we have
> here is when a driver is obviously based on another driver and didn't
> update this particular field and so while the name field reflects
> something unique the linker entry itself is not. In a few places this
> provides a more suitable string name as well, however.
> 
> [...]

Applied to u-boot/master, thanks!

[1/1] global: Correct duplicate U_BOOT_DRIVER entry names
      commit: 8c212d6e2e778b4f294d1d9f85eac9680a66d463
-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
