Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HijH/T7rmnZKgIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 09 Mar 2026 17:57:24 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 140DF23D303
	for <lists+uboot-stm32@lfdr.de>; Mon, 09 Mar 2026 17:57:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD0D8C2909A;
	Mon,  9 Mar 2026 16:57:23 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76F77C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 16:57:22 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7d756f2a06dso397426a34.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1773075441; x=1773680241;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fk7MieXlL8fEifawAJb9JG3xr5DwRFIeW9SUUC5/7cI=;
 b=CpMKBcdSQMXpauhBlMh9ZjLoo4eCyY3Zw7aL42nOy6wHAUuSgiZlcrZV3+6uZV0QwJ
 kFjBVd0JoLqKVujJAcSJBaMLVq61GGLV4+UOHrk3XMg3WdOHuXy/xcBBPbfJDkKuUJ0d
 95bXbRvlln4tOl14rJr+wUuS2i64fMpA10Znw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773075441; x=1773680241;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fk7MieXlL8fEifawAJb9JG3xr5DwRFIeW9SUUC5/7cI=;
 b=F7aNNPJssb7unxUOh/LEO33TTt1D9awi/fxP5Dj2Qqf+zT8IHrNX4t52JZJIqxVasi
 QN8gZynXLNp5eHaIekNp8B+iFka9vKbKAOwwzHZRYzxJB8CosJ8kp61dcpf1GOIzdB7Z
 EIqL2qEtSWsKJHhO8xpYGSF4hKVqmuW5MAAkjjxB4YzVpU9A8beGSVAw4jwTQrukObHj
 +JU9QEL6oiLYnaNG0ZUx1KTmrM3JIRfRrijlqJjlB+XiPTvCkRXt7ihlUQRu+TVP1OEf
 CoN0jij/1s5moUz+4eZVTC/CU8QjKQGDeajU9wKsq42+Ilz90ZATIFVbMwupycRAVKEi
 Fe2g==
X-Gm-Message-State: AOJu0Yysg932Xa65i+8JnIHrEH9Y3RsaT67BIfnaYb9BwhNfvCglnLpk
 Ao6a2QeCpSxznb9WD9jONKE6dIWRyeOacyayeDE/hAUCbSO0zZx/4xHOKypGIpUOU3tRG049ZOO
 qsmwAl3A=
X-Gm-Gg: ATEYQzwZKACzMXuduSpDssDVQozdSjoM/ouYThk9bvUvJk3rdgcmVsJSkA6FrKpxEee
 5KafZMlRnxkK1NvThcPTgL9F3yffEDjiWTTEyzxal9+fqAE4rpOZ0mE3Ye7W1Dou0R/OCQluODj
 UGAf/p2ETTRKUHk3s/6WELwgxGUrqPannl0MLJKXRucBZHsL8U5AQf4l5GMpf+Wy44yv5cN9cFC
 ANu1G6JZ1zCqzkPWn41UB9766GqqTlnq0dXRQcx6JiftR2rKVNyzvLPrEwT3UEemfWca+etjM7u
 AG69mUOxkgPYeMi3BKM6j5Bl5zVZRS6spAkGcxoODgPFCWu3GyTn6Z2Ek4HA5FuANDkRm8aycsw
 Pn9JUvA4fDcbG4XAd05tbDu+OVRHMBPrJyAoZGxHmvYqyy74R+b+FiF/X1t0zaN8TeibrFsplqc
 lK093bUUcvfKjIhSWjWw3GYPQzTsVdXtcv7L4NHbl7LFBk9yQOSU+bOcm7EjDku079W5otgwjV3
 HhL0dGTVt8IH3w3HGMcSTnAabZUTC+tJtIqIm0DonVj
X-Received: by 2002:a05:6830:7092:10b0:7d7:4eaa:8b82 with SMTP id
 46e09a7af769-7d759ba8e9fmr94341a34.17.1773075441096; 
 Mon, 09 Mar 2026 09:57:21 -0700 (PDT)
Received: from [127.0.1.1] (fixed-187-191-8-235.totalplay.net. [187.191.8.235])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d74885b5a4sm2690201a34.23.2026.03.09.09.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 09:57:20 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>
In-Reply-To: <20260205-dsi-v1-1-eb5805068e97@gmail.com>
References: <20260205-dsi-v1-1-eb5805068e97@gmail.com>
Message-Id: <177307544022.3622694.5493452468697889151.b4-ty@konsulko.com>
Date: Mon, 09 Mar 2026 10:57:20 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.3
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: dsi: add .of_to_plat
	callback
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
X-Rspamd-Queue-Id: 140DF23D303
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[konsulko.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[konsulko.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[st-md-mailman.stormreply.com,lists.denx.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[konsulko.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.962];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[foss.st.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[konsulko.com:mid]
X-Rspamd-Action: no action

On Thu, 05 Feb 2026 00:35:40 +0100, Raphael Gallais-Pou wrote:

> Drivers should extract device-tree data before probing via the
> .of_to_plat hook.
> 
> Implement it for stm32_dsi driver.  By doing so, it also solve a
> variable shadowing in stm32_dsi_probe() where &clk was used as
> peripheral clock and ref clock.
> 
> [...]

Applied to u-boot/master, thanks!

[1/1] video: stm32: dsi: add .of_to_plat callback
      commit: 0b429f7c6b9de24eb4b8d8ddab74b0020994c405
-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
